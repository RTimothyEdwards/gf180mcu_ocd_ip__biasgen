v {xschem version=3.4.6 file_version=3.3}
G {}
K {}
V {}
S {}
E {}
T {Note:  Vtrim and ena are both in the digital 3.3V domain} -150 490 0 0 0.3 0.3 {}
T {CACE TEMPLATE: Vbg vs temperature curve, for plotting} -430 60 0 0 0.4 0.4 {}
N 430 210 480 210 {lab=vbg}
N 200 350 250 350 {lab=#net1}
N 200 350 200 390 {lab=#net1}
N 130 330 250 330 {lab=#net2}
N 130 330 130 390 {lab=#net2}
N -110 310 250 310 {lab=vss}
N -110 310 -110 390 {lab=vss}
N -110 230 250 230 {lab=vss}
N -110 230 -110 310 {lab=vss}
N -30 190 -30 390 {lab=vdd}
N -30 190 250 190 {lab=vdd}
N 50 250 50 390 {lab=dvdd}
N 50 210 250 210 {lab=dvdd}
N 50 250 250 250 {lab=dvdd}
N 50 210 50 250 {lab=dvdd}
N 170 290 250 290 {lab=vtrim[15:0]}
N -110 450 200 450 {lab=GND}
C {devices/vsource.sym} -110 420 0 0 {name=Vvss value=0 savecurrent=false}
C {devices/gnd.sym} 10 450 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -390 1630 0 0 {name=s1 only_toplevel=false value=".option savecurrents
.control
save all
dc temp -40 125 1
*** Curve for plotting:  one row per temperature point.
wrdata CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data v(vbg)
*** (the measurements below are unused here but harmless)
meas dc vbgmax_m40to125 max v(vbg) from=-40 to=125
meas dc vbgmin_m40to125 min v(vbg) from=-40 to=125
meas dc vbgmin_m0to85 min v(vbg) from=0 to=85
meas dc vbgmax_m0to85 max v(vbg) from=0 to=85
meas dc vbg_27 find v(vbg) at=27
meas dc vbg_m40 find v(vbg) at=-40
meas dc vbg_125 find v(vbg) at=125
**
*** The denominator is the MEASURED output, not a constant.  It used to
*** be a literal 1.25 (the IHP bandgap nominal), and the port rewrote it
*** to 3.3-something -- porting.txt maps 1.2 -> 3.3 with no word
*** boundary, so the rule fired inside the number.  That understated
*** every tempco here by 2.6x, and it was invisible because the result
*** is still a plausible-looking number.  Dividing by vbg_27, measured
*** eight lines up, leaves nothing for a substitution to damage and
*** self-normalises per corner.
***
*** NO 1e6 SCALING EITHER:  the value goes out in base units and CACE
*** applies the prefix from the parameter unit: field.  Pre-scaling here
*** AND declaring unit: ppm/C scales it twice -- that is what turned
*** 118 ppm/C into 118417000 ppm/C in the summary table.
let tempco_m40_125_ppmC=(vbgmax_m40to125 - vbgmin_m40to125)/165/vbg_27
let tempco_m0_85_ppmC=(vbgmax_m0to85 - vbgmin_m0to85)/85/vbg_27
***
*** SIGNED slope, which the min/max tempco above cannot give.
*** Too much CTAT (low trim) makes this negative, too much PTAT
*** (high trim) positive, so a sign CHANGE between trim=0 and
*** trim=16 proves the flat point lies inside the trim range.
*** That is the bracket test, and it needs no search and no
*** assumption about what the output voltage ought to be.
*** Volts, not millivolts:  unit: mV in the datasheet does the scaling.
let vslope_mV=(vbg_125 - vbg_m40)
**
print tempco_m40_125_ppmC
print tempco_m0_85_ppmC
**
.endc"}
C {devices/code_shown.sym} -380 550 0 0 {name=s2 only_toplevel=false value="*** GF180MCU model setup.  This is NOT a renaming of the IHP lines it
*** replaces:  IHP ships one .lib file per device class (cornerMOShv,
*** cornerPNP, cornerRES ...), while GF180MCU puts every device class in
*** sm141064.ngspice as a named section, so the file is the same each
*** time and only the section changes.
***
*** design.ngspice must come FIRST and is easy to miss:  it defines
*** sw_stat_global, sw_stat_mismatch, mc_skew and fnoicor, which the
*** model sections reference over a hundred times but do not define
*** themselves.  Without it every model evaluates against undefined
*** parameters.
***
*** There is also no separate hv/lv MOS library here;  the one MOS
*** section covers both the 3.3 V and 5.0 V devices.
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice

*** MONTE CARLO SWITCHES.  design.ngspice sets both to 0, so these must
*** be re-declared AFTER it is included;  a later .param wins.  They
*** are given inline defaults of 0 below, so the corner parameters are
*** unaffected -- verified by checking that the result does not move
*** with the seed when both are 0.
***
***   sw_stat_global    inter-die process variation
***   sw_stat_mismatch  intra-die device-to-device mismatch
***
*** Kept as two conditions rather than one because for this circuit they
*** differ by more than an order of magnitude.
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
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice bjt_CACE\{corner_pnp\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice diode_CACE\{corner_dio\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice res_CACE\{corner_res\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice mimcap_CACE\{corner_cap\}

.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.ref/gf180mcu_as_sc_mcu7t3v3/spice/gf180mcu_as_sc_mcu7t3v3.spice

*** The DUT.  CACE netlists it separately (schematic, layout, pex
*** or rcx, per --source) and only copies the SYMBOL into the run
*** directory, so xschem cannot expand it here and the instance
*** line would otherwise reference an unknown subckt.
.include CACE\{DUT_path\}
"}
C {devices/vsource.sym} -30 420 0 0 {name=Vvdd value=3.3 savecurrent=false}
C {lab_pin.sym} -110 310 0 0 {name=p1 sig_type=std_logic lab=vss}
C {lab_pin.sym} -30 190 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {isource.sym} 130 420 0 0 {name=I0 value=250n}
C {lab_pin.sym} 170 290 0 0 {name=p3 sig_type=std_logic lab=vtrim[15:0]}
C {devices/vsource.sym} 50 420 0 0 {name=Vdvdd value=3.3 savecurrent=false}
C {lab_pin.sym} 50 210 0 0 {name=p5 sig_type=std_logic lab=dvdd}
C {lab_pin.sym} 480 210 0 1 {name=p6 sig_type=std_logic lab=vbg}
C {isource.sym} 200 420 0 0 {name=I1 value=1u}
C {gf180mcu_ocd_ip__bandgap.sym} 270 290 0 0 {name=x3}
C {devices/code_shown.sym} -390 900 0 0 {name=s3 only_toplevel=false value="*** Trim thermometer code, one source per bit.
*** The condition is the NUMBER OF BITS SET, 0 to 16, which is all a
*** thermometer code can express.  The two vector sources this
*** replaces could only be all-high or all-low together, which is why
*** every trim setting previously needed a manual schematic edit.
*** NOTE the arithmetic.  CACE[] is evaluated by safe_eval, which
*** allows + - * / % ** and bare math-module calls ONLY --- no
*** comparisons and no conditional expression, so a python
*** conditional is rejected.  copysign(1, x) returns +/-1, so
*** (1 + copysign(1, trim - i - 0.5)) / 2 is 1 when trim > i and
*** 0 otherwise.  The 0.5 keeps the argument off zero, where
*** copysign would return +1 and set the bit one code early.
*** Also note: bare copysign(), NOT math.copysign() --- safe_eval
*** reads the callee as node.func.id and an attribute lookup
*** raises before checkmath() ever sees it.
Vt0  vtrim[0] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 0 - 0.5)) / 2]
Vt1  vtrim[1] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 1 - 0.5)) / 2]
Vt2  vtrim[2] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 2 - 0.5)) / 2]
Vt3  vtrim[3] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 3 - 0.5)) / 2]
Vt4  vtrim[4] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 4 - 0.5)) / 2]
Vt5  vtrim[5] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 5 - 0.5)) / 2]
Vt6  vtrim[6] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 6 - 0.5)) / 2]
Vt7  vtrim[7] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 7 - 0.5)) / 2]
Vt8  vtrim[8] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 8 - 0.5)) / 2]
Vt9  vtrim[9] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 9 - 0.5)) / 2]
Vt10 vtrim[10] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 10 - 0.5)) / 2]
Vt11 vtrim[11] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 11 - 0.5)) / 2]
Vt12 vtrim[12] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 12 - 0.5)) / 2]
Vt13 vtrim[13] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 13 - 0.5)) / 2]
Vt14 vtrim[14] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 14 - 0.5)) / 2]
Vt15 vtrim[15] GND CACE[3.3 * (1 + copysign(1, CACE\{trim\} - 15 - 0.5)) / 2]
"}
