/* Behavioral verilog model for the class-AB amplifier configured as a
 * unity-gain buffer.
 *
 * This model produces a real-valued output based on the circuit
 * function and digital inputs.
 */

module gf180mcu_ocd_ip__classab_buffer (
    `ifdef USE_POWER_PINS
	inout wire vdd,
	inout wire vss,
    `endif 

    input wire ena,		// Circuit enable

    input wire real bias,	// 1uA Current bias sink
    input wire real inp,	// Input

    output wire real out	// Buffered output
);

/* Bias range check.  See the same block in the bandgap model for why
 * this is a readable flag and a warning rather than a clamp or an
 * error.  The sink current is nominally -1 uA;  the behavior away from
 * that value has not been characterized.
 *
 * "bias" is a SINK.
 */
localparam real ISINK_NOM   = -1e-6;
localparam real BIAS_TOL    = 0.10;	/* fractional, on each bias */

wire bias_ok = (bias >= ISINK_NOM * (1.0 + BIAS_TOL)) &&
		(bias <= ISINK_NOM * (1.0 - BIAS_TOL));

always @(bias_ok or ena) begin
    if ((ena === 1'b1) && (bias_ok !== 1'b1))
	$display("WARNING: %m at %0t: current bias out of range: bias = %g A (sink, want %g)",
		 $time, bias, ISINK_NOM);
end

/*
 * Circuit behavior:  The class-AB amplifier is connected as a unity-gain
 * buffer (output connected back to the negative input).  So the output
 * follows the input unless the circuit is dsiabled.
 */

localparam real NAN = 0.0/0.0;

/* A DISABLED BUFFER MODELS AS NOT DRIVING, not as driving 0.0.
 *
 * This output is tied at the frame level to the folded-cascode buffer's
 * output, so exactly one of the two drives at a time and the other must
 * be invisible.  Driving 0.0 would fight the active buffer.
 *
 * That is also what the circuit now does:  with the series switch in the
 * output stage (XMOSW) and the pull-up on outs1, a disabled buffer
 * leaves its output floating -- measured at 19.6 Mohm and a few pA --
 * rather than pulling it to ground.  Before that change 0.0 was the
 * honest model;  now NaN is.
 *
 * NaN is this project's convention for a net nobody is driving, as used
 * by the diagnostic switches.  Both the disabled and unknown cases give
 * NaN here, so one ternary covers them.
 */
assign out = (ena === 1'b1) ? inp : NAN;

endmodule
