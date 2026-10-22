v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {Note:  Vtrim and ena are both in the digital 3.3V domain} -150 490 0 0 0.3 0.3 {}
T {Testbench to determine the minimum resistance through the
trim resistor chain when all switches are closed.} -400 60 0 0 0.4 0.4 {}
N 370 310 370 380 {lab=vss}
N 370 440 370 470 {lab=GND}
N 220 440 370 440 {lab=GND}
N 110 440 220 440 {lab=GND}
N 110 270 110 380 {lab=vtrim[15:0]}
N 110 270 350 270 {lab=vtrim[15:0]}
N 220 180 220 380 {lab=vdd}
N 420 200 420 230 {lab=vres}
N 420 310 420 440 {lab=GND}
N 370 440 420 440 {lab=GND}
N 220 110 220 180 {lab=vdd}
N 220 110 420 110 {lab=vdd}
N 420 110 420 140 {lab=vdd}
C {devices/vsource.sym} 370 410 0 0 {name=Vvss value=0 savecurrent=false}
C {devices/gnd.sym} 370 470 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -170 580 0 0 {name=s1 only_toplevel=false value=".option savecurrents
.control
save all
op
print V(vres) / I(Vmeas)
.endc"}
C {devices/code_shown.sym} -170 750 0 0 {name=s2 only_toplevel=false value=".lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice typical
.lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice res_typical
.include $PDK_ROOT/gf180mcuD/libs.tech/ngspice/design.ngspice
"}
C {devices/vsource.sym} 110 410 0 0 {name=Vtrim[15:0] value=3.3 savecurrent=false}
C {lab_pin.sym} 370 340 0 0 {name=p1 sig_type=std_logic lab=vss}
C {lab_pin.sym} 110 270 0 0 {name=p3 sig_type=std_logic lab=vtrim[15:0]}
C {bg_trim.sym} 370 320 0 0 {name=x1}
C {devices/vsource.sym} 220 410 0 0 {name=Vvdd value=3.3 savecurrent=false}
C {lab_pin.sym} 220 180 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {ammeter.sym} 420 170 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {lab_pin.sym} 420 210 0 1 {name=p4 sig_type=std_logic lab=vres}
