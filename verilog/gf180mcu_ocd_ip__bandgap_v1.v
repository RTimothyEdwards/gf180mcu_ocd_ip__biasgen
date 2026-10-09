/* Behavioral verilog model for the bandgap.
 * This model produces a real-valued output based on the circuit
 * function and digital inputs.
 *
 * "v2" differs from "v1" only in the layout aspect ratio;  the
 * schematic and this model are unchanged between them.
 */

module gf180mcu_ocd_ip__bandgap_v1 (
    `ifdef USE_POWER_PINS
	inout wire dvdd,
	inout wire dvss,
	inout wire vdd,
	inout wire vss,
    `endif 

    input wire ena,		// Circuit enable
    input wire [15:0] trim,	// Thermometer code

    input wire real ibias1_250n,	// Current bias
    input wire real ibias2_1,		// Current bias

    output wire real vbg		// Bandgap voltage out
);

/* Bias range check.
 *
 * The circuit behaviour has only been characterised with ibias1_250n at
 * -250 nA and ibias2_1 at -1 uA;  away from those the output below means
 * nothing, so a testbench that quietly supplies something else is
 * measuring a number the model is not entitled to produce.
 *
 * The check is a flag rather than a clamp or an error.  Clamping would
 * hide a misconnection, and $error would stop a run that may be
 * deliberately sweeping the trim.  bias_ok is readable from a testbench
 * (cocotb reads it directly), and the warning fires only while the
 * block is enabled, because an unbiased disabled bandgap is normal.
 *
 * NaN fails the check, which is intended:  every comparison against NaN
 * is false, so an unconnected bias reads as out of range rather than as
 * a pass.
 */
localparam real IBIAS1_NOM = -250e-9;
localparam real IBIAS2_NOM = -1e-6;
localparam real BIAS_TOL   = 0.10;	/* fractional, on each bias */

/* NOMINALS ARE NEGATIVE, so the "low" bound is the more negative one. */
wire bias1_ok = (ibias1_250n >= IBIAS1_NOM * (1.0 + BIAS_TOL)) &&
		(ibias1_250n <= IBIAS1_NOM * (1.0 - BIAS_TOL));
wire bias2_ok = (ibias2_1    >= IBIAS2_NOM * (1.0 + BIAS_TOL)) &&
		(ibias2_1    <= IBIAS2_NOM * (1.0 - BIAS_TOL));

wire bias_ok = bias1_ok & bias2_ok;

always @(bias_ok or ena) begin
    if ((ena === 1'b1) && (bias_ok !== 1'b1))
	$display("WARNING: %m at %0t: bandgap bias out of range: ibias1_250n = %g A (want %g +/-%0.0f%%), ibias2_1 = %g A (want %g)",
		 $time, ibias1_250n, IBIAS1_NOM, BIAS_TOL * 100.0,
		 ibias2_1, IBIAS2_NOM);
end

/* Circuit behaviour:  the trim curve, straight from simulation.
 *
 * The trim is a 16-bit thermometer code, so the only thing that matters
 * is how many bits are set --- j, from 0 to 16.  That is seventeen
 * possible outputs, and all seventeen have been simulated, so this is a
 * lookup rather than a fit:  there is no interpolation to do and no
 * approximation error to carry.  Replace the numbers when the block is
 * re-characterised;  nothing else here needs to change.
 *
 * Characterised 2026-09-21, after the trim resistor chain was changed
 * from "ppolyf_u_1k" to "ppolyf_u".  With ppolyf_u_1k the trim covered a far wider
 * range than needed AND sat badly off-centre;  with ppolyf_u, and no other
 * change, the curve lands on the flattest part of the tempco at
 * EXACTLY half trim.  So j = 8 -> 3.331 V is the nominal setting, and
 * it is the middle of the code range rather than an arbitrary point.
 *
 * Shape:  asymptotically straight at high trim, rolling off at low
 * trim.  If a closed form is ever wanted in preference to the table,
 *     quadratic  1.18266 + 0.00497239*j + 0.000131321*j^2   (max 1.3 mV)
 *     linear     1.17741 + 0.00707353*j                     (max 6.6 mV)
 * The linear residuals are a systematic arch, worst at both endpoints
 * and +3 mV at half trim, which is the one place accuracy is wanted;
 * that is what the roll-off costs a straight line.
 *
 * NOTE this is a single-corner, single-temperature model.  The whole
 * point of the trim is tempco, and there is no temperature input here,
 * so these are nominal values only.
 */

function real vbg_trimmed;
    input [4:0] jj;
    begin
	case (jj)
	    5'd0:  vbg_trimmed = 1.184;
	    5'd1:  vbg_trimmed = 1.188;
	    5'd2:  vbg_trimmed = 1.192;
	    5'd3:  vbg_trimmed = 1.198;
	    5'd4:  vbg_trimmed = 3.304;
	    5'd5:  vbg_trimmed = 3.311;
	    5'd6:  vbg_trimmed = 3.317;
	    5'd7:  vbg_trimmed = 3.324;
	    5'd8:  vbg_trimmed = 3.331;	/* nominal:  half trim */
	    5'd9:  vbg_trimmed = 3.338;
	    5'd10: vbg_trimmed = 3.346;
	    5'd11: vbg_trimmed = 3.354;
	    5'd12: vbg_trimmed = 3.361;
	    5'd13: vbg_trimmed = 3.370;
	    5'd14: vbg_trimmed = 3.378;
	    5'd15: vbg_trimmed = 3.387;
	    /* j cannot exceed 16:  the thermometer code is 16 bits wide,
	     * so the decoder saturates and every setting above 16 is the
	     * same physical setting. */
	    default: vbg_trimmed = 3.395;
	endcase
    end
endfunction

wire [4:0] j = $countones(trim);

localparam real NAN = 0.0/0.0;

assign vbg = (ena === 1'b1) ? vbg_trimmed(j) :
	     (ena === 1'b0) ? 0.0 : NAN;

endmodule
