v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {CACE TEMPLATE: voltgen buffered output: load step settling} -400 -60 0 0 0.4 0.4 {}
C {devices/code_shown.sym} -400 40 0 0 {name=s1 only_toplevel=false value=".option savecurrents
.option TEMP=CACE\{temperature\}

*** GF180MCU model setup.  This is NOT a renaming of the IHP lines it
*** replaces:  IHP ships one .lib file per device class (cornerMOShv,
*** cornerMOSlv, cornerRES ...), while GF180MCU puts every device class
*** in sm141064.ngspice as a named section, so the file is the same each
*** time and only the section changes.
***
*** design.ngspice must come FIRST and is easy to miss:  it defines
*** sw_stat_global, sw_stat_mismatch, mc_skew and fnoicor, which the
*** model sections reference over a hundred times but do not define
*** themselves.  Without it every model evaluates against undefined
*** parameters.
***
*** There is also no separate hv/lv MOS library here;  the one MOS
*** section covers the 3.3 V and the 5/6 V devices together.
***
*** CORNER COVERAGE IS NOT WHAT IT LOOKS LIKE.  The MOS sections
*** typical, ss, ff, sf and fs each skew ONLY the 03v3 devices;  all
*** five pull nfet_06v0_t and pfet_06v0_t, the TYPICAL 6 V models,
*** because no skewed 6 V models exist in this PDK.  So every 5/6 V
*** device in this block is at typical in every corner, and any part of
*** voltgen built from them does not move across the corner axis at all.
*** Keep that in mind when reading a corner sweep that looks suspiciously
*** flat:  it is the PDK, not the circuit.
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice

*** MONTE CARLO SWITCHES.  design.ngspice sets both of these to 0, so
*** they have to be re-declared AFTER it is included;  a later .param
*** wins.  They are given inline defaults of 0 in the lines below, so
*** every corner parameter is unaffected and only the MC parameters turn
*** them on.  Verified: with both at 0 the result does not move when the
*** seed changes.
***
***   sw_stat_global    inter-die process variation
***   sw_stat_mismatch  intra-die device-to-device mismatch
***
*** The PDK calls both=1 the realistic setting.  They are separate
*** conditions because for this circuit they differ by more than an
*** order of magnitude, and knowing which one dominates is the whole
*** point of running it.
.param sw_stat_global=CACE\{mc_global=0\}
.param sw_stat_mismatch=CACE\{mc_mismatch=0\}

*** The seed must advance with the iteration or every MC sample is
*** identical.  The iteration count defaults to 0 for non-MC runs.
*** NOTE: prose in this block must contain no braces and no CACE
*** token syntax.  An unescaped brace breaks xschem's record parsing
*** (it reports SKIP RECORD and the netlist comes out truncated), and
*** an escaped one would be substituted by CACE as if it were real.
.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice diode_CACE\{corner_dio\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice res_CACE\{corner_res\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice mimcap_CACE\{corner_cap\}

.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.ref/gf180mcu_as_sc_mcu7t3v3/spice/gf180mcu_as_sc_mcu7t3v3.spice

*** The DUT.  CACE netlists it separately (schematic, layout, pex or
*** rcx, per --source) and only copies the SYMBOL into the run
*** directory, so xschem cannot expand it here and the instance line
*** would otherwise reference an unknown subckt.
.include CACE\{DUT_path\}

*** SCOPE:  this characterises the BUFFERED output only.
***
*** voltgen contains one output buffer, the low-power folded cascode on
*** vout_buf.  The high-drive class-AB buffer is a separate cell that
*** sits beside it in chipalooza_frame and is characterised with the
*** frame, not here.  vout_unbuf is brought out for that buffer to use;
*** it is the bare resistor tap, outside the feedback loop, so loading
*** it is an uncorrected error and nothing here loads it.

Vvss  vss  0    DC 0
Vdvss dvss 0    DC 0
Vvdd  vdd  vss  DC CACE\{Vdd\}
Vdvdd dvdd dvss DC CACE\{Vdvdd\}

*** Ideal reference, so the block is specified independently of the
*** bandgap.  Note it does not REJECT its reference, it scales it:
*** vout = (s+1)*vbg/(4-high), a gain of 0.25 to 2.67, so bandgap noise
*** and supply rejection are multiplied by up to 8.5 dB on the way to a
*** user project.  These numbers are the buffer, not the delivered bias.
Vvbg  vbg  vss  DC CACE\{Vbg\}

*** ibias1u_1 SOURCES into the feedback amplifier;  ibias1u_2 sinks from
*** the cascode buffer.  Separate conditions so a disabled buffer can
*** have its bias removed, which is the documented usage.
I1 vss       ibias1u_1 DC CACE\{Ibias\}
I2 ibias1u_2 vss       DC CACE\{Ibias2\}

*** Enables are SENSE-POSITIVE:  a high level enables.  Each amplifier
*** is disabled by a shunt pFET that pulls its bias node to vdd, which
*** is why a disabled amplifier must also have its bias current removed
*** -- otherwise the current source fights the shunt.
Vena  ena  dvss DC CACE[CACE\{Vdvdd\} * CACE\{Ena\}]
Vena1 ena1 dvss DC CACE[CACE\{Vdvdd\} * CACE\{Ena1\}]
Vena2 ena2 dvss DC CACE[CACE\{Vdvdd\} * CACE\{Ena2\}]
Vhigh high dvss DC CACE[CACE\{Vdvdd\} * CACE\{high\}]

*** s[2:0] is binary;  bracket expressions permit + - * / % ** and bare
*** math calls only, so each bit is extracted with % and divide.
Vs0 s[0] dvss DC CACE[CACE\{Vdvdd\} * (CACE\{s\} % 2)]
Vs1 s[1] dvss DC CACE[CACE\{Vdvdd\} * (((CACE\{s\} - (CACE\{s\} % 2)) / 2) % 2)]
Vs2 s[2] dvss DC CACE[CACE\{Vdvdd\} * (((CACE\{s\} - (CACE\{s\} % 4)) / 4) % 2)]

Cl    vout_buf vss CACE\{Cload\}
Iload vout_buf vss PWL(0 0 100u 0 100.1u CACE\{Istep\})

Xdut dvdd dvss vdd s[2] s[1] s[0] vbg vss ibias1u_1 vout_buf ibias1u_2 ena
+ vout_unbuf ena1 ena2 high vgen_ena2_h gf180mcu_ocd_ip__voltgen

.control
save all
*** A LOAD step, not a reference step:  the reference is a quiet bandgap,
*** whereas a user project switching in is the disturbance this buffer
*** actually sees.
tran 20n 200u
meas tran v_settled find v(vout_buf) at=99u
meas tran v_final   find v(vout_buf) at=199u
*** Window starts AFTER the edge:  from=100u would include the pre-step
*** sample, making the maximum the old operating point and reporting the
*** step size as overshoot.
meas tran v_min min v(vout_buf) from=100.2u to=200u
meas tran v_max max v(vout_buf) from=100.2u to=200u
let dstep_V = v_final - v_settled
let over_V  = v_max - v_final
let under_V = v_final - v_min
echo $&dstep_V $&over_V $&under_V > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
