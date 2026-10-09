v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {Note:  Vtrim and ena are both in the digital 3.3V domain} -150 490 0 0 0.3 0.3 {}
T {Testbench to measure temperature coefficient} -430 60 0 0 0.4 0.4 {}
N 430 210 480 210 {lab=vbg}
N 200 350 250 350 {lab=#net1}
N 200 350 200 390 {lab=#net1}
N 130 330 250 330 {lab=#net2}
N 130 330 130 390 {lab=#net2}
N -110 310 250 310 {lab=vss}
N -110 310 -110 390 {lab=vss}
N -220 290 -220 390 {lab=vtrim[7:0]}
N -110 230 250 230 {lab=vss}
N -110 230 -110 310 {lab=vss}
N -30 190 -30 390 {lab=vdd}
N -30 190 250 190 {lab=vdd}
N 50 250 50 390 {lab=dvdd}
N 50 210 250 210 {lab=dvdd}
N 50 250 250 250 {lab=dvdd}
N 50 210 50 250 {lab=dvdd}
N 170 290 250 290 {lab=vtrim[15:0]}
N -330 450 200 450 {lab=GND}
N -330 350 -330 390 {lab=vtrim[15:8]}
C {devices/vsource.sym} -110 420 0 0 {name=Vvss value=0 savecurrent=false}
C {devices/gnd.sym} -160 450 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -380 750 0 0 {name=s1 only_toplevel=false value=".option savecurrents
.control
save all
dc temp -40 125 1
plot V(vbg)
*** Calculate tempco
meas dc vbgmax_m40to125 max v(vbg) from=-40 to=125
meas dc vbgmin_m40to125 min v(vbg) from=-40 to=125
meas dc vbgmin_m0to85 min v(vbg) from=0 to=85
meas dc vbgmax_m0to85 max v(vbg) from=0 to=85
**
let tempco_m40_125_ppmC=1e6*(vbgmax_m40to125 - vbgmin_m40to125)/165/3.35
let tempco_m0_85_ppmC=1e6*(vbgmax_m0to85 - vbgmin_m0to85)/85/3.35
**
print tempco_m40_125_ppmC
print tempco_m0_85_ppmC
.endc"}
C {devices/code_shown.sym} -380 550 0 0 {name=s2 only_toplevel=false value=".lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice typical
.lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice diode_typical
.lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice res_typical
.lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice mimcap_typical
.lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice bjt_typical
.include $PDK_ROOT/gf180mcuD/libs.tech/ngspice/design.ngspice

.include $PDK_ROOT/gf180mcuD/libs.ref/gf180mcu_as_sc_mcu7t3v3/spice/gf180mcu_as_sc_mcu7t3v3.spice
"}
C {devices/vsource.sym} -220 420 0 0 {name=Vtrim[7:0] value=3.3 savecurrent=false}
C {devices/vsource.sym} -30 420 0 0 {name=Vvdd value=3.3 savecurrent=false}
C {lab_pin.sym} -110 310 0 0 {name=p1 sig_type=std_logic lab=vss}
C {lab_pin.sym} -30 190 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {isource.sym} 130 420 0 0 {name=I0 value=250n}
C {lab_pin.sym} 170 290 0 0 {name=p3 sig_type=std_logic lab=vtrim[15:0]}
C {devices/vsource.sym} 50 420 0 0 {name=Vdvdd value=3.3 savecurrent=false}
C {lab_pin.sym} 50 210 0 0 {name=p5 sig_type=std_logic lab=dvdd}
C {lab_pin.sym} 480 210 0 1 {name=p6 sig_type=std_logic lab=vbg}
C {isource.sym} 200 420 0 0 {name=I1 value=1u}
C {devices/vsource.sym} -330 420 0 0 {name=Vtrim1[7:0] value=0 savecurrent=false}
C {lab_pin.sym} -330 350 0 0 {name=p7 sig_type=std_logic lab=vtrim[15:8]}
C {lab_pin.sym} -220 290 0 0 {name=p4 sig_type=std_logic lab=vtrim[7:0]}
C {gf180mcu_ocd_ip__bandgap.sym} 270 290 0 0 {name=x1}
