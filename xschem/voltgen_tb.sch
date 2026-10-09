v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {Note:  Vtrim is in the digital 3.3V domain} -120 480 0 0 0.3 0.3 {}
N 700 310 740 310 {lab=vout2}
N 240 450 240 560 {lab=GND}
N 370 470 370 500 {lab=vsel[2]}
N 540 470 540 500 {lab=vsel[1]}
N 710 470 710 500 {lab=vsel[0]}
N 300 400 300 500 {lab=vss}
N 300 400 600 400 {lab=vss}
N 240 560 710 560 {lab=GND}
N 150 320 400 320 {lab=dvdd}
N -30 120 70 120 {lab=vdd}
N -30 200 400 200 {lab=#net1}
N 150 300 150 320 {lab=dvdd}
N 150 140 490 140 {lab=dvdd}
N 490 140 490 160 {lab=dvdd}
N 70 120 600 120 {lab=vdd}
N 600 120 600 160 {lab=vdd}
N 70 120 70 390 {lab=vdd}
N -250 450 240 450 {lab=GND}
N -250 220 -250 390 {lab=#net2}
N -250 220 400 220 {lab=#net2}
N 240 260 240 390 {lab=#net3}
N 240 260 400 260 {lab=#net3}
N 150 280 400 280 {lab=dvdd}
N 150 140 150 280 {lab=dvdd}
N 150 300 400 300 {lab=dvdd}
N 150 280 150 300 {lab=dvdd}
N 370 360 400 360 {lab=vsel[2:0]}
N 150 320 150 390 {lab=dvdd}
N -30 120 -30 140 {lab=vdd}
N -70 120 -30 120 {lab=vdd}
N 280 340 400 340 {lab=vss}
N 280 340 280 400 {lab=vss}
N 280 400 300 400 {lab=vss}
N 940 260 980 260 {lab=vout1}
N 700 260 820 260 {lab=#net4}
N 700 330 810 330 {lab=#net5}
N 810 230 810 330 {lab=#net5}
N 810 230 820 230 {lab=#net5}
N 890 300 890 350 {lab=GND}
N 240 450 870 450 {lab=GND}
N 870 310 870 390 {lab=#net6}
N 870 450 920 450 {lab=GND}
N 920 350 920 450 {lab=GND}
N 890 350 920 350 {lab=GND}
N 600 120 890 120 {lab=vdd}
N 890 120 890 220 {lab=vdd}
C {devices/vsource.sym} 300 530 0 0 {name=Vvss value=0 savecurrent=false}
C {devices/gnd.sym} -60 450 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -170 540 0 0 {name=s1 only_toplevel=false value=".option savecurrents
.control
save all
tran 10n 20u
plot V(vout1) V(vout2)
.endc"}
C {devices/code_shown.sym} -170 710 0 0 {name=s2 only_toplevel=false value=".lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice typical
.lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice diode_typical
.lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice res_typical
.lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice mimcap_typical
.include $PDK_ROOT/gf180mcuD/libs.tech/ngspice/design.ngspice

.include $PDK_ROOT/gf180mcuD/libs.ref/gf180mcu_as_sc_mcu7t3v3/spice/gf180mcu_as_sc_mcu7t3v3.spice
"}
C {devices/vsource.sym} 70 420 0 0 {name=Vvdd value=5.0 savecurrent=false}
C {lab_pin.sym} 300 480 0 0 {name=p1 sig_type=std_logic lab=vss}
C {lab_pin.sym} -70 120 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {isource.sym} 870 420 0 0 {name=I0 value=1u}
C {lab_pin.sym} 370 360 0 0 {name=p3 sig_type=std_logic lab=vsel[2:0]}
C {devices/vsource.sym} 150 420 0 0 {name=Vdvdd value=3.3 savecurrent=false}
C {lab_pin.sym} 150 140 0 0 {name=p5 sig_type=std_logic lab=dvdd}
C {gf180mcu_ocd_ip__voltgen.sym} 550 310 0 0 {name=x1}
C {lab_pin.sym} 740 310 0 1 {name=p4 sig_type=std_logic lab=vout2}
C {devices/vsource.sym} 240 420 0 0 {name=Vbg value=1.25 savecurrent=false}
C {devices/vsource.sym} 710 530 0 0 {name=Vsel0 value="PULSE(0 3.3 0 10n 10n 2.5u 5u)" savecurrent=false}
C {lab_pin.sym} 370 470 0 1 {name=p6 sig_type=std_logic lab=vsel[2]}
C {lab_pin.sym} 540 470 0 1 {name=p7 sig_type=std_logic lab=vsel[1]}
C {lab_pin.sym} 710 470 0 1 {name=p8 sig_type=std_logic lab=vsel[0]}
C {devices/vsource.sym} 540 530 0 0 {name=Vsel1 value="PULSE(0 3.3 0 10n 10n 5u 10u)" savecurrent=false}
C {devices/vsource.sym} 370 530 0 0 {name=Vsel2 value="PULSE(0 3.3 0 10n 10n 10u 20u)" savecurrent=false}
C {isource.sym} -30 170 0 0 {name=I1 value=1u}
C {isource.sym} -250 420 0 0 {name=I2 value=1u}
C {lab_pin.sym} 980 260 0 1 {name=p9 sig_type=std_logic lab=vout1}
C {gf180mcu_ocd_ip__classab_buffer_5v.sym} 970 260 0 0 {name=x3}
