/* Behavioral verilog model for the voltage bias generator.
 * This model produces a real-valued output based on the circuit
 * function and digital inputs.
 */

module gf180mcu_ocd_ip__voltgen (
    `ifdef USE_POWER_PINS
	inout wire dvdd,
	inout wire dvss,
	inout wire vdd,
	inout wire vss,
    `endif 

    input wire ena,		// Circuit enable
    input wire ena1,		// Enable 1st output buffer
    input wire ena2,		// Enable 2nd output buffer
    input wire high,		// High output setting
    input wire [2:0] s,		// Output value selection

    input wire real ibias1u_1,	// Current bias
    input wire real ibias1u_2,	// Current bias
    input wire real vbg,	// Bandgap voltage in

    output wire	vgen_ena2_h,	// "ena2" exported in 5V domain
    output wire real vout_unbuf, // Unbuffered output
    output wire real vout_buf	 // Buffered output
);

/* Bias range check.  See the same block in the bandgap model for why
 * this is a readable flag and a warning rather than a clamp or an
 * error.  The two sinks are nominally -1 uA and the source +1 uA;  the
 * behaviour away from those has not been characterised.
 *
 * WHICH PIN IS WHICH:  ibias1u_1 is the SOURCE;  ibias1u_2 is a SINK.
 */
localparam real ISINK_NOM   = -1e-6;
localparam real ISOURCE_NOM =  1e-6;
localparam real BIAS_TOL    = 0.10;	/* fractional, on each bias */

wire bias1_ok = (ibias1u_1 >= ISOURCE_NOM * (1.0 - BIAS_TOL)) &&
		(ibias1u_1 <= ISOURCE_NOM * (1.0 + BIAS_TOL));
wire bias2_ok = (ibias1u_2 >= ISINK_NOM * (1.0 + BIAS_TOL)) &&
		(ibias1u_2 <= ISINK_NOM * (1.0 - BIAS_TOL));

wire bias_ok = bias1_ok & bias2_ok;

always @(bias_ok or ena) begin
    if ((ena === 1'b1) && (bias_ok !== 1'b1))
	$display("WARNING: %m at %0t: voltgen bias out of range: ibias1u_1 = %g A (source, want %g), ibias1u_2 = %g A, A (sinks, want %g each)",
		 $time, ibias1u_1, ISOURCE_NOM,
		 ibias1u_2, ISINK_NOM);
end

/* Circuit behavior:  Selection "s" multiplexes from a resistor change;
 * lower values are closer to zero.  The midpoint of the resistor chain
 * is forced to vbg by the feedback amplifier.  If "high" is selected,
 * then the point below on the resistor chain is forced to vbg.  So the
 * resistor chain values, which are evenly divided, are:
 * ((s + 1) * (vbg / 4)) when high = 0 and
 * ((s + 1) * (vbg / 3)) when high = 1.  In total:
 *
 * vout_unbuf = ((s + 1) * (vbg / (4 - high)))
 *
 * Both vout_unbuf and vout_buf originate from the same signal, so they
 * are essentially the same value.
 */

/* Three-way rather than a plain ternary, and === rather than ==.
 *
 * For these blocks 0.0 is a LEGITIMATE value:  a disabled bandgap or
 * bias generator really does sit at ground, unlike a disconnected
 * switch.  So the off state must stay 0.0 and cannot be NaN.
 *
 * That makes an unknown enable dangerous:  with ==, the comparison is x
 * and a ternary with an x condition collapses to 0.0 on real operands,
 * which is indistinguishable from a deliberately disabled block.  The
 * third branch says what is actually true --- enable unknown, output
 * unknown --- and NaN propagates so it cannot be mistaken downstream.
 */
localparam real NAN = 0.0/0.0;

/* The x-guard covers the value inputs too:  a reduction xor is x if
 * any bit of the concatenation is x, so an unknown trim setting
 * yields NaN rather than an arithmetic result computed from x. */
assign vout_unbuf = (^{ena, s, high} === 1'bx) ? NAN :
	       (ena === 1'b1) ? ((s + 1) * (vbg / (4 - high))) : 0.0;
/* vout_buf is the FOLDED-CASCODE buffer's output, enabled by ena1, and
 * it is tied at the frame level to the class-AB buffer's output.  So it
 * has to follow the same rule:  when this buffer is disabled it is not
 * driving, and models as NaN rather than as 0.0.  The previous version
 * assigned vout_unbuf unconditionally, which left the cascode driving
 * the shared node even with ena1 low.
 *
 * vout_unbuf keeps its 0.0 off-state:  it is the resistor tap, and with
 * the master enable off the chain really does sit at ground.
 *
 * Ignoring the complexities of the follower-amplifier, assume gain=1.
 */
assign vout_buf = (ena1 === 1'b1) ? vout_unbuf : NAN;

/* ena2, exported to the external class-AB buffer in the 5 V domain.
 * In the schematic this is a bare level_shift_5v cell from ena2 (x54), with
 * no gating by the master enable -- exactly like vgen_ena1_h for the
 * on-board cascode.  The shift is transparent in a behavioural model, so
 * this is a straight pass-through;  what matters is that it is DRIVEN,
 * because the class-AB buffer takes its enable from here and an
 * unassigned output left that buffer permanently off.
 *
 * Note neither buffer is gated by the master enable.  With the master
 * off the chain is unpowered and vout_unbuf is 0 V, so an enabled buffer
 * drives a real 0 V rather than going high impedance;  only its own
 * enable decides whether it drives at all.
 */
assign vgen_ena2_h = ena2;

endmodule
