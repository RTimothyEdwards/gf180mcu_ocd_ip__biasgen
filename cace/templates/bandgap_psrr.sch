v {xschem version=3.4.6 file_version=3.3}
G {}
K {}
V {}
S {}
E {}
T {Note:  Vtrim and ena are both in the digital 3.3V domain} -150 490 0 0 0.3 0.3 {}
T {CACE TEMPLATE: PSRR} -420 0 0 0 0.4 0.4 {}
N 200 350 250 350 {lab=#net1}
N 200 350 200 390 {lab=#net1}
N 130 330 250 330 {lab=#net2}
N 130 330 130 390 {lab=#net2}
N 170 290 250 290 {lab=vtrim[15:0]}
N 10 70 10 100 {lab=dvdd}
N -300 310 -300 390 {lab=vss}
N 10 210 250 210 {lab=#net3}
N 10 160 10 210 {lab=#net3}
N -220 190 250 190 {lab=#net4}
N -220 150 -220 190 {lab=#net4}
N -220 60 -220 90 {lab=vdd}
N -300 310 250 310 {lab=vss}
N -300 450 480 450 {lab=GND}
N -220 270 -220 330 {lab=vdd}
N -300 230 250 230 {lab=vss}
N -300 230 -300 310 {lab=vss}
N 10 250 250 250 {lab=dvdd}
N 10 250 10 390 {lab=dvdd}
N 590 210 600 210 {lab=vbg}
N 480 210 480 230 {lab=vbg}
N 430 210 480 210 {lab=vbg}
N 590 210 590 230 {lab=vbg}
N 480 210 590 210 {lab=vbg}
N 590 290 590 310 {lab=GND}
N 480 310 590 310 {lab=GND}
N 480 290 480 310 {lab=GND}
N 480 310 480 450 {lab=GND}
C {devices/vsource.sym} -300 420 0 0 {name=Vvss value=0 savecurrent=false}
C {devices/gnd.sym} -180 450 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -390 1630 0 0 {name=s1 only_toplevel=false value=".option savecurrents
.option TEMP=CACE\{temperature\}
.control
save all
tran 10u 10m
let psrr = maximum(vbg) - minimum(vbg) / 0.02
let psrrdb = 20 * log(abs($&psrr))

echo $&psrrdb > CACE\{simpath\}/CACE\{filename\}_\{N\}.data
.endc"}
C {devices/code_shown.sym} -380 550 0 0 {name=s2 only_toplevel=false value=".lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerMOShv.lib mos_CACE\{corner\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerMOSlv.lib mos_CACE\{corner\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerPNP.lib CACE\{corner_pnp\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerDIO.lib dio_CACE\{corner_dio\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerRES.lib res_CACE\{corner_res\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerCAP.lib cap_CACE\{corner_cap\}

.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.ref/gf180mcu_as_sc_mcu7t5v0/spice/gf180mcu_as_sc_mcu7t5v0.spice

*** The DUT.  CACE netlists it separately (schematic, layout, pex
*** or rcx, per --source) and only copies the SYMBOL into the run
*** directory, so xschem cannot expand it here and the instance
*** line would otherwise reference an unknown subckt.
.include CACE\{DUT_path\}
"}
C {devices/vsource.sym} -220 420 0 0 {name=Vvdd value="DC CACE\{Vavdd\}" savecurrent=false}
C {lab_pin.sym} -300 310 0 0 {name=p1 sig_type=std_logic lab=vss}
C {lab_pin.sym} -220 270 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {isource.sym} 130 420 0 0 {name=I0 value=250n}
C {lab_pin.sym} 170 290 0 0 {name=p3 sig_type=std_logic lab=vtrim[15:0]}
C {devices/vsource.sym} 10 420 0 0 {name=Vdvdd value="DC CACE\{Vdvdd\}" savecurrent=false}
C {lab_pin.sym} 10 330 0 0 {name=p5 sig_type=std_logic lab=dvdd}
C {lab_pin.sym} 600 210 0 1 {name=p6 sig_type=std_logic lab=vbg}
C {isource.sym} 200 420 0 0 {name=I1 value=1u}
C {gf180mcu_ocd_ip__bandgap_v3.sym} 270 290 0 0 {name=x3}
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
C {devices/vsource.sym} 10 130 0 0 {name=Vsense2 value="dc 0" savecurrent=false}
C {lab_pin.sym} 10 70 0 0 {name=p4 sig_type=std_logic lab=dvdd}
C {devices/vsource.sym} -220 360 0 0 {name=Vin value="AC 1 sin( 0.1 CACE\{frequency\})" savecurrent=false}
C {devices/vsource.sym} -220 120 0 0 {name=Vsense1 value="dc 0" savecurrent=false}
C {lab_pin.sym} -220 60 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {capa.sym} 480 260 0 0 {name=C1
m=1
value=CACE\{Cload\}
footprint=1206
device="ceramic capacitor"}
C {res.sym} 590 260 0 0 {name=R1
value="CACE\{Rload\}"
footprint=1206
device=resistor
m=1}
