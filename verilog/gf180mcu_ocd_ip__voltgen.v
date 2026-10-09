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
    input wire real ibias1u_3,	// Current bias
    input wire real vbg,	// Bandgap voltage in

    output wire real vout1,	// 1st buffer output
    output wire real vout2	// 2nd buffer output
);

/* Bias range check.  See the same block in the bandgap model for why
 * this is a readable flag and a warning rather than a clamp or an
 * error.  The two sinks are nominally -1 uA and the source +1 uA;  the
 * behaviour away from those has not been characterised.
 *
 * WHICH PIN IS WHICH:  ibias1u_1 is the SOURCE;  ibias1u_2 and ibias1u_3
 * are the two SINKS.  This block previously had 1 and 3 the other way
 * round, which is why it stayed quiet while chipalooza_frame had
 * voltgen_source_ibias and voltgen_sink1_ibias crossed -- the check
 * agreed with the wrong wiring, so simulation passed and the error only
 * surfaced in LVS against the schematic.
 */
localparam real ISINK_NOM   = -1e-6;
localparam real ISOURCE_NOM =  1e-6;
localparam real BIAS_TOL    = 0.10;	/* fractional, on each bias */

wire bias1_ok = (ibias1u_1 >= ISOURCE_NOM * (1.0 - BIAS_TOL)) &&
		(ibias1u_1 <= ISOURCE_NOM * (1.0 + BIAS_TOL));
wire bias2_ok = (ibias1u_2 >= ISINK_NOM * (1.0 + BIAS_TOL)) &&
		(ibias1u_2 <= ISINK_NOM * (1.0 - BIAS_TOL));
wire bias3_ok = (ibias1u_3 >= ISINK_NOM * (1.0 + BIAS_TOL)) &&
		(ibias1u_3 <= ISINK_NOM * (1.0 - BIAS_TOL));

wire bias_ok = bias1_ok & bias2_ok & bias3_ok;

always @(bias_ok or ena) begin
    if ((ena === 1'b1) && (bias_ok !== 1'b1))
	$display("WARNING: %m at %0t: voltgen bias out of range: ibias1u_1 = %g A (source, want %g), ibias1u_2 = %g A, ibias1u_3 = %g A (sinks, want %g each)",
		 $time, ibias1u_1, ISOURCE_NOM,
		 ibias1u_2, ibias1u_3, ISINK_NOM);
end

/* Circuit behavior:  Selection "s" multiplexes from a resistor change;
 * lower values are closer to zero.  The midpoint of the resistor chain
 * is forced to vbg by the feedback amplifier.  If "high" is selected,
 * then the point below on the resistor chain is forced to vbg.  So the
 * resistor chain values, which are evenly divided, are:
 * ((s + 1) * (vbg / 4)) when high = 0 and
 * ((s + 1) * (vbg / 3)) when high = 1.  In total:
 *
 * vout1 = ((s + 1) * (vbg / (4 - high)))
 *
 * Both vout1 and vout2 buffer the same signal, so vout2 = vout1.
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
assign vout1 = (^{ena, s, high} === 1'bx) ? NAN :
	       (ena === 1'b1) ? ((s + 1) * (vbg / (4 - high))) : 0.0;
assign vout2 = vout1;

endmodule
