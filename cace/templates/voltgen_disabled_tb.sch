v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {CACE TEMPLATE: voltgen + class-AB buffer: disabled output impedance} -400 -60 0 0 0.4 0.4 {}
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

*** Both buffers drive one shared output node in the frame, so both are
*** present here;  the class-AB buffer is a separate cell and is
*** included directly rather than coming from CACE.
.include CACE\{root\}/netlist/schematic/gf180mcu_ocd_ip__classab_buffer.spice

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
*** the folded-cascode buffer, Ibias3 from the class-AB buffer.  In
*** ngspice I n+ n- value drives value from n+ to n- inside the source,
*** so it leaves at n-.  One condition each so they can be set
*** independently:  a disabled amplifier must have its bias REMOVED, but
*** the feedback amplifier has to stay biased throughout or the resistor
*** chain is not regulated at all.
I1 vss       ibias1u_1 DC CACE\{Ibias\}
I2 ibias1u_2 vss       DC CACE\{Ibias2\}
I3 cab_bias  vss       DC CACE\{Ibias3\}

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

Cl     vout vss CACE\{Cload\}
Vforce vout vss DC 1.2

Xdut dvdd dvss vdd s[2] s[1] s[0] vbg vss ibias1u_1 vout ibias1u_2 ena
+ vout_unbuf ena1 ena2 high vgen_ena2_h gf180mcu_ocd_ip__voltgen
Xcab vdd vout vout_unbuf vss cab_bias vgen_ena2_h
+ gf180mcu_ocd_ip__classab_buffer

.control
save all
*** The two buffers share one output node, so whichever is NOT selected
*** must let go of it.  This forces the shared node to a series of
*** voltages and measures the current the disabled amplifier draws.
*** A properly disabled output is high impedance;  a partly-off one
*** sources or sinks current and drags the active buffer.
***
*** The configuration under test is set by the Ena* conditions, so the
*** same template covers both-off, cascode-only and classAB-only by
*** enumeration rather than by three separate templates.
***
*** The top force point tracks the supply, since Vdd may be 3.3 or 5.0
*** here;  the lower three are absolute, being well inside either rail.
dc Vforce 0.2 CACE[CACE\{Vdd\} - 0.2] 0.01
meas dc i03 find i(vforce) at=0.3
meas dc i12 find i(vforce) at=1.2
meas dc i24 find i(vforce) at=2.4
meas dc ihi find i(vforce) at=CACE[CACE\{Vdd\} - 0.3]
*** Emitted in BASE SI UNITS -- amps and ohms -- NOT pre-scaled.  CACE
*** applies the prefix in the parameter unit: field to the raw value,
*** so a number already scaled to nA under unit: nA is scaled twice.
*** That turned a perfectly good 21 Gohm into 0.021 Mohm and failed the
*** spec while the circuit was working correctly.
let l03 = i03
let l12 = i12
let l24 = i24
let lhi = ihi
*** The resistance is reported as a MAGNITUDE.  Once the amplifier is
*** properly off the leakage is picoamps, and the slope of a picoamp
*** against 200 mV is numerical noise whose SIGN is arbitrary -- a
*** signed value failed a sensible minimum with -35000 Mohm while the
*** part was working correctly.  The leakage limits are the real test;
*** this number is a readability aid, not a criterion.
meas dc ia find i(vforce) at=1.1
meas dc ib find i(vforce) at=1.3
let rsh_ohm = abs(0.2 / (ib - ia))
echo $&l03 $&l12 $&l24 $&lhi $&rsh_ohm > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
