v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -380 -300 -270 -300 {
lab=ena}
N -450 -240 -270 -240 {
lab=refsel}
N 30 -240 110 -240 {
lab=avdd}
N 30 -280 110 -280 {
lab=avdd}
N 30 -260 250 -260 {
lab=avss}
N 30 -90 380 -90 {
lab=source0}
N 110 -280 110 -240 {lab=avdd}
N -380 -90 -270 -90 {lab=ena}
N -380 -60 -270 -60 {lab=ena}
N -380 -90 -380 -60 {lab=ena}
N 30 -60 420 -60 {lab=sink0}
N -290 -120 -270 -120 {lab=pbias}
N 180 -300 530 -300 {
lab=#net1}
N -290 -120 -290 -10 {lab=pbias}
N -290 -10 -270 -10 {lab=pbias}
N -300 -140 -270 -140 {lab=pcasc}
N -300 -140 -300 10 {lab=pcasc}
N -300 10 -270 10 {lab=pcasc}
N -310 -160 -270 -160 {lab=nbias}
N -310 -160 -310 30 {lab=nbias}
N -310 30 -270 30 {lab=nbias}
N -320 -180 -270 -180 {lab=ncasc}
N -320 -180 -320 50 {lab=ncasc}
N -320 50 -270 50 {lab=ncasc}
N -390 -10 -290 -10 {lab=pbias}
N -390 10 -300 10 {lab=pcasc}
N -390 30 -310 30 {lab=nbias}
N -390 50 -320 50 {lab=ncasc}
N 40 50 110 50 {lab=avdd}
N 110 10 110 50 {lab=avdd}
N 40 10 110 10 {lab=avdd}
N 40 30 250 30 {lab=avss}
N -300 90 -270 90 {lab=#net2}
N -380 -60 -380 270 {lab=ena}
N 480 90 480 270 {lab=source1}
N 40 110 530 110 {lab=sink1}
N 110 50 110 270 {lab=avdd}
N 180 -10 180 270 {lab=#net1}
N 250 30 250 270 {lab=avss}
N 380 -90 380 270 {lab=source0}
N 40 90 480 90 {lab=source1}
N -300 110 -300 270 {lab=#net2}
N -300 110 -270 110 {lab=#net2}
N -300 90 -300 110 {lab=#net2}
N -690 -200 -690 270 {lab=fine}
N -690 -200 -270 -200 {lab=fine}
N -520 -280 -270 -280 {
lab=ref}
N -610 -260 -270 -260 {
lab=vbg}
N -450 -240 -450 270 {lab=refsel}
N -610 -260 -610 270 {lab=vbg}
N -520 -280 -520 270 {lab=ref}
N -380 -300 -380 -90 {lab=ena}
N -770 330 480 330 {lab=GND}
N -770 -220 -770 270 {lab=coarse}
N -770 -220 -270 -220 {lab=coarse}
N 40 -10 180 -10 {lab=#net1}
N 110 -240 110 10 {lab=avdd}
N 180 -300 180 -10 {lab=#net1}
N 30 -300 180 -300 {
lab=#net1}
N 250 -260 250 30 {lab=avss}
N 420 -240 420 -60 {lab=sink0}
N 530 -240 530 110 {lab=sink1}
N 30 -220 110 -220 {lab=avdd}
C {devices/vsource.sym} 180 300 0 0 {name=Vavdd value=5.0 savecurrent=false}
C {devices/vsource.sym} 110 300 0 0 {name=Vvss value=0 savecurrent=false}
C {devices/gnd.sym} -140 330 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 380 300 0 0 {name=Vsource0 value=1 savecurrent=false}
C {devices/vsource.sym} 420 -270 0 0 {name=Vsink0 value=1.5 savecurrent=false}
C {devices/lab_pin.sym} 380 -30 0 1 {name=p2 sig_type=std_logic lab=source0}
C {devices/lab_pin.sym} 420 -210 0 1 {name=p3 sig_type=std_logic lab=sink0}
C {devices/vsource.sym} -450 300 0 0 {name=Vsel value=3.3 savecurrent=false}
C {devices/vsource.sym} -520 300 0 0 {name=Vref value=DC 5.0 savecurrent=false}
C {devices/lab_wire.sym} -520 -280 0 1 {name=p5 sig_type=std_logic lab=ref}
C {devices/lab_wire.sym} -380 -300 0 1 {name=p6 sig_type=std_logic lab=ena}
C {devices/lab_wire.sym} 60 -260 0 1 {name=p8 sig_type=std_logic lab=avss}
C {devices/lab_wire.sym} 60 -280 0 1 {name=p9 sig_type=std_logic lab=avdd}
C {devices/code_shown.sym} -560 380 0 0 {name=s1 only_toplevel=false value=".option savecurrents
.control
save all
dc Vref 5.0 1.5 -0.1
print I(vsink0) I(vsource0) I(vsink1) I(vsource1)
print I(v.x1.vmeas) I(v.x1.vmeas1) I(v.x1.vmeas2)
print V(nbias) V(pbias) V(ncasc) V(pcasc) V(x1.vfb)
print V(x1.x3.vcom) V(x1.x3.outn)
.endc"}
C {devices/code_shown.sym} -560 600 0 0 {name=s2 only_toplevel=false value=".lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice typical
.lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice diode_typical
.lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice res_typical
.lib $PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.spice mimcap_typical
.include $PDK_ROOT/gf180mcuD/libs.tech/ngspice/design.ngspice

.include $PDK_ROOT/gf180mcuD/libs.ref/gf180mcu_as_sc_mcu7t3v3/spice/gf180mcu_as_sc_mcu7t3v3.spice
"}
C {devices/vsource.sym} -610 300 0 0 {name=Vbg value=1.25 savecurrent=false}
C {devices/lab_wire.sym} -610 -260 0 1 {name=p7 sig_type=std_logic lab=vbg}
C {devices/vsource.sym} -380 300 0 0 {name=Vena1 value=3.3 savecurrent=false}
C {devices/lab_wire.sym} -450 -240 0 1 {name=p10 sig_type=std_logic lab=refsel}
C {devices/vsource.sym} 250 300 0 0 {name=Vdvdd value=3.3 savecurrent=false}
C {bias_generator_fe.sym} -120 -80 0 0 {name=x1}
C {lab_pin.sym} -390 -10 0 0 {name=p11 sig_type=std_logic lab=pbias}
C {lab_pin.sym} -390 10 0 0 {name=p12 sig_type=std_logic lab=pcasc}
C {lab_pin.sym} -390 30 0 0 {name=p13 sig_type=std_logic lab=nbias}
C {lab_pin.sym} -390 50 0 0 {name=p14 sig_type=std_logic lab=ncasc}
C {devices/vsource.sym} 480 300 0 0 {name=Vsource1 value=1 savecurrent=false}
C {devices/vsource.sym} 530 -270 0 0 {name=Vsink1 value=1.5 savecurrent=false}
C {devices/lab_pin.sym} 530 -210 0 1 {name=p1 sig_type=std_logic lab=sink1}
C {devices/lab_pin.sym} 480 140 0 1 {name=p4 sig_type=std_logic lab=source1}
C {bias_generator_be0.sym} -110 290 0 0 {name=x2}
C {devices/vsource.sym} -300 300 0 0 {name=Vena2[4:0] value=3.3 savecurrent=false}
C {devices/vsource.sym} -690 300 0 0 {name=Vfine value=0 savecurrent=false}
C {devices/lab_wire.sym} -690 -200 0 1 {name=p15 sig_type=std_logic lab=fine}
C {devices/vsource.sym} -770 300 0 0 {name=Vcoarse value=3.3 savecurrent=false}
C {devices/lab_wire.sym} -770 -220 0 1 {name=p16 sig_type=std_logic lab=coarse}
