v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
P 4 5 1070 -860 1070 20 1690 20 1690 -860 1070 -860 {}
P 4 5 1000 -860 60 -860 60 20 1000 20 1000 -860 {}
T {Startup} 1080 -850 0 0 0.4 0.4 {}
T {Bandgap} 70 -850 0 0 0.4 0.4 {}
T {Standalone bandgap with external 250uA bias} 60 -910 0 0 0.4 0.4 {}
T {based on bandgap design for sky130 by Christoph Weiser} 60 60 0 0 0.4 0.4 {}
T {trim[*] bits are in the digital 3.3V domain} -475 -90 0 0 0.3 0.3 {}
T {1.8pF} 820 -390 0 0 0.3 0.3 {}
T {~1pF} 1580 -310 0 0 0.3 0.3 {}
T {~1pF} 1750 -280 0 0 0.3 0.3 {}
N 390 -110 410 -110 {lab=vss}
N 390 0 450 0 {lab=vss}
N 450 0 730 0 {lab=vss}
N 100 -110 120 -110 {lab=vss}
N 100 0 160 0 {lab=vss}
N 160 0 390 -0 {lab=vss}
N 340 -800 340 -740 {lab=vdd}
N 160 -800 160 -740 {lab=vdd}
N 730 -410 730 0 {lab=vss}
N 780 -450 880 -450 {lab=gate}
N 730 -800 730 -490 {lab=vdd}
N 160 -420 660 -420 {lab=vn}
N 1660 -0 1720 0 {lab=vss}
N 160 -680 160 -600 {lab=comp}
N 310 -500 310 -470 {lab=vss}
N 340 -710 380 -710 {lab=vdd}
N 120 -710 160 -710 {lab=vdd}
N 400 -200 400 -170 { lab=vss}
N 450 -330 450 -280 { lab=#net1}
N 450 -200 450 -140 { lab=#net2}
N 710 -400 710 -370 { lab=bias}
N 880 -450 1150 -450 { lab=gate}
N 1270 -210 1270 0 { lab=vss}
N 1190 -350 1270 -350 { lab=vs1}
N 1150 -450 1150 -380 { lab=gate}
N 1120 -350 1150 -350 { lab=vss}
N 1270 -240 1300 -240 { lab=vss}
N 1150 -320 1150 0 { lab=vss}
N 1240 -530 1270 -530 { lab=vdd}
N 1270 -350 1270 -270 { lab=vs1}
N 1200 -240 1230 -240 { lab=vbg}
N 1270 -500 1270 -350 { lab=vs1}
N 1550 -530 1580 -530 { lab=vdd}
N 1430 -530 1510 -530 { lab=vs2}
N 1430 -530 1430 -460 { lab=vs2}
N 1550 -500 1550 -460 { lab=vs2}
N 1430 -390 1430 -370 { lab=vs2}
N 1430 -310 1430 0 { lab=vss}
N 1550 -310 1550 0 { lab=vss}
N 1550 -460 1550 -370 { lab=vs2}
N 1430 -460 1550 -460 { lab=vs2}
N 1550 -800 1550 -560 { lab=vdd}
N 1270 -800 1270 -560 { lab=vdd}
N 1350 -340 1390 -340 { lab=vdd}
N 1430 -340 1450 -340 { lab=vs2}
N 1450 -390 1450 -340 { lab=vs2}
N 1430 -390 1450 -390 { lab=vs2}
N 100 -110 100 0 {lab=vss}
N 160 -80 160 0 {lab=vss}
N 390 -110 390 0 {lab=vss}
N 450 -80 450 0 {lab=vss}
N 340 -800 730 -800 {lab=vdd}
N 160 -500 160 -420 {lab=vn}
N 730 -0 880 0 {lab=vss}
N 1150 0 1270 0 {lab=vss}
N 880 0 1150 0 {lab=vss}
N 1310 -530 1430 -530 { lab=vs2}
N 1270 0 1430 0 {lab=vss}
N 1430 0 1550 0 {lab=vss}
N 1270 -800 1550 -800 {lab=vdd}
N 730 -800 1270 -800 {lab=vdd}
N 1430 -460 1430 -390 { lab=vs2}
N -390 -240 -360 -240 {lab=trim[15:0]}
N -280 -240 -220 -240 {lab=#net3}
N -390 -240 -390 -200 {lab=trim[15:0]}
N -430 -240 -390 -240 {lab=trim[15:0]}
N -390 -200 -250 -200 {lab=trim[15:0]}
N -250 -220 -250 -200 {lab=trim[15:0]}
N -250 -220 -220 -220 {lab=trim[15:0]}
N -70 -240 380 -240 {lab=#net4}
N -360 -350 -310 -350 {lab=dvdd}
N -360 -320 -310 -320 {lab=dvss}
N -390 -480 -390 -430 {lab=ena}
N -430 -430 -390 -430 {lab=ena}
N -240 -480 -240 -450 {lab=#net5}
N -240 -450 -220 -450 {lab=#net5}
N -40 -450 660 -450 {lab=ena_h}
N -40 -530 -40 -450 {lab=ena_h}
N -70 -450 -40 -450 {lab=ena_h}
N -80 -530 -40 -530 {lab=ena_h}
N -390 -530 -390 -480 {lab=ena}
N -390 -200 -390 -140 {lab=trim[15:0]}
N 160 -800 340 -800 {lab=vdd}
N 200 -710 300 -710 {lab=gate}
N 340 -670 340 -600 {lab=vbg}
N 340 -670 540 -670 {lab=vbg}
N 340 -680 340 -670 {lab=vbg}
N 340 -500 340 -480 {lab=vp}
N 540 -480 660 -480 {lab=vp}
N 540 -640 540 -480 {lab=vp}
N 340 -480 540 -480 {lab=vp}
N 390 -640 540 -640 {lab=vp}
N 390 -640 390 -600 {lab=vp}
N 390 -330 450 -330 {lab=#net1}
N 420 -500 500 -500 {lab=vss}
N 420 -600 490 -600 {lab=vss}
N 1550 0 1610 -0 {lab=vss}
N 1610 -0 1660 -0 {lab=vss}
N 1550 -800 1720 -800 {lab=vdd}
N 1720 -290 1720 -0 {lab=vss}
N 1720 -800 1720 -350 {lab=vdd}
N 160 -420 160 -380 {lab=vn}
N 160 -320 160 -140 {lab=#net6}
N 390 -500 390 -390 {lab=#net7}
N -390 -480 -360 -480 {lab=ena}
N -280 -480 -240 -480 {lab=#net5}
N -390 -430 -220 -430 {lab=ena}
N 930 -450 930 -370 {lab=gate}
N 930 -310 930 -0 {lab=vss}
C {devices/lab_wire.sym} 320 0 0 0 {name=l2 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 660 -480 0 0 {name=l22 sig_type=std_logic lab=vp}
C {devices/lab_wire.sym} 730 -410 3 0 {name=l3 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 660 -420 0 0 {name=l5 sig_type=std_logic lab=vn}
C {devices/iopin.sym} 1720 -800 0 0 {name=p1 lab=vdd}
C {devices/iopin.sym} 1720 0 0 0 {name=p2 lab=vss}
C {devices/opin.sym} 540 -670 0 0 {name=p3 lab=vbg}
C {devices/lab_wire.sym} 820 -450 0 0 {name=l6 sig_type=std_logic lab=gate}
C {devices/lab_wire.sym} 270 -710 0 0 {name=l1 sig_type=std_logic lab=gate}
C {devices/iopin.sym} 710 -370 1 0 {name=p4 lab=bias}
C {bg_res.sym} 280 -470 0 0 {name=xres
}
C {devices/lab_wire.sym} 310 -500 3 0 {name=l4 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 160 -660 3 0 {name=l10 sig_type=std_logic lab=comp}
C {devices/lab_wire.sym} 380 -710 0 0 {name=l7 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 160 -710 0 0 {name=l8 sig_type=std_logic lab=vdd}
C {devices/ipin.sym} -430 -240 0 0 {name=p5 lab=trim[15:0]
}
C {bg_trim.sym} 400 -190 0 0 {name=xtr
}
C {devices/lab_wire.sym} 400 -200 3 0 {name=l19 sig_type=std_logic lab=vss}
C {se_folded_cascode_p.sym} 810 -450 0 0 {name=xamp
}
C {devices/lab_wire.sym} 1150 -350 0 0 {name=l11 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1270 -240 0 1 {name=l12 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1270 -530 0 0 {name=l13 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1230 -240 0 0 {name=l14 sig_type=std_logic lab=vbg}
C {devices/lab_wire.sym} 1550 -530 0 1 {name=l15 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1250 -350 0 0 {name=l16 sig_type=std_logic lab=vs1
}
C {devices/lab_wire.sym} 1430 -530 0 0 {name=l17 sig_type=std_logic lab=vs2
}
C {devices/lab_wire.sym} 1390 -340 0 0 {name=l18 sig_type=std_logic lab=vdd}
C {level_shift.sym} -70 -200 0 0 {name=x1[15:0] vdd=vdd vss=vss}
C {devices/iopin.sym} -360 -320 0 1 {name=p6 lab=dvss}
C {devices/iopin.sym} -360 -350 0 1 {name=p7 lab=dvdd}
C {lab_pin.sym} -310 -350 0 1 {name=p8 sig_type=std_logic lab=dvdd}
C {lab_pin.sym} -310 -320 0 1 {name=p9 sig_type=std_logic lab=dvss}
C {devices/ipin.sym} -430 -430 0 0 {name=p10 lab=ena
}
C {level_shift.sym} -70 -410 0 0 {name=x3 vdd=vdd vss=vss}
C {devices/opin.sym} -80 -530 0 1 {name=p11 lab=ena_h}
C {devices/lab_wire.sym} 490 -600 0 1 {name=l9 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 500 -500 0 1 {name=l20 sig_type=std_logic lab=vss}
C {diode_2.sym} -300 -530 0 0 {name=x2 VDD=dvdd VNW=dvdd VPW=dvss VSS=dvss prefix=gf180mcu_as_sc_mcu7t3v3__ }
C {inv_2.sym} -320 -480 0 0 {name=x5 VDD=dvdd VNW=dvdd VPW=dvss VSS=dvss prefix=gf180mcu_as_sc_mcu7t3v3__ }
C {fillcap_4.sym} -310 -580 0 0 {name=x6[4:0] VDD=dvdd VNW=dvdd VPW=dvss VSS=dvss prefix=gf180mcu_as_sc_mcu7t3v3__ }
C {inv_2.sym} -320 -240 0 0 {name=x2[15:0] VDD=dvdd VNW=dvdd VPW=dvss VSS=dvss prefix=gf180mcu_as_sc_mcu7t3v3__ }
C {diode_2.sym} -300 -140 0 0 {name=x3[15:0] VDD=dvdd VNW=dvdd VPW=dvss VSS=dvss prefix=gf180mcu_as_sc_mcu7t3v3__ }
C {tap_2.sym} -310 -640 0 0 {name=x4[1:0] VSS=dvss VDD=dvdd prefix=gf180mcu_as_sc_mcu7t3v3__ }
C {gf180mcu_fd_pr/pnp_05p00x05p00.sym} 430 -110 0 0 {name=Q3
model=pnp_05p00x05p00
spiceprefix=X
m=8}
C {gf180mcu_fd_pr/pnp_05p00x05p00.sym} 140 -110 0 0 {name=Q1
model=pnp_05p00x05p00
spiceprefix=X
m=1}
C {gf180mcu_fd_pr/cap_mim_2f0fF.sym} 1550 -340 0 0 {name=C1
W=22e-6
L=22e-6
model=cap_mim_2f0_m4m5_noshield
spiceprefix=X
m=1}
C {gf180mcu_fd_pr/cap_mim_2f0fF.sym} 1720 -320 0 0 {name=C2
W=22e-6
L=22e-6
model=cap_mim_2f0_m4m5_noshield
spiceprefix=X
m=1}
C {gf180mcu_fd_pr/cap_mim_2f0fF.sym} 930 -340 0 1 {name=C3
W=30e-6
L=30e-6
model=cap_mim_2f0_m4m5_noshield
spiceprefix=X
m=1}
C {gf180mcu_fd_pr/pfet_03v3.sym} 180 -710 0 1 {name=M8
L=0.5u
W=4u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {gf180mcu_fd_pr/pfet_03v3.sym} 320 -710 0 0 {name=M1
L=0.5u
W=4u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {gf180mcu_fd_pr/nfet_03v3.sym} 1250 -240 0 0 {name=M2
L=1u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {gf180mcu_fd_pr/pfet_03v3.sym} 1290 -530 0 1 {name=M9
L=1u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {gf180mcu_fd_pr/pfet_03v3.sym} 1530 -530 0 0 {name=M5
L=1u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {gf180mcu_fd_pr/pfet_03v3.sym} 1410 -340 0 0 {name=M6
L=1u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {gf180mcu_fd_pr/nfet_03v3.sym} 1170 -350 0 1 {name=M3
L=1u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {ammeter.sym} 160 -350 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {ammeter.sym} 390 -360 0 0 {name=Vmeas1 savecurrent=true spice_ignore=0}
