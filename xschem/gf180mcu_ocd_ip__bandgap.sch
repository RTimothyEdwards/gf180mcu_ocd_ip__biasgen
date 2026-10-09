v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 150 260 210 260 {lab=dvdd}
N 360 260 510 260 {lab=vbg_unbuf}
N 690 290 710 290 {lab=vbg}
N 580 330 580 360 {lab=vss}
N 580 360 600 360 {lab=vss}
N 580 220 580 250 {lab=vdd}
N 580 220 600 220 {lab=vdd}
N 690 290 690 390 {lab=vbg}
N 630 290 690 290 {lab=vbg}
N 510 390 690 390 {lab=vbg}
N 510 320 510 390 {lab=vbg}
N 560 340 560 410 {lab=ibias2_1u}
N 470 290 510 290 {lab=ena_b_h}
N 150 300 210 300 {lab=trim[15:0]}
N 150 280 210 280 {lab=dvss}
N 150 240 210 240 {lab=vdd}
N 150 360 210 360 {lab=vss}
N 360 340 470 340 {lab=ena_b_h}
N 470 290 470 340 {lab=ena_b_h}
N 170 320 210 320 {lab=ibias1_250n}
N 170 320 170 400 {lab=ibias1_250n}
N 150 330 160 330 {lab=ena}
N 160 330 160 340 {lab=ena}
N 160 340 210 340 {lab=ena}
C {bandgap_unbuffered.sym} 230 340 0 0 {name=x1}
C {se_folded_cascode_np_ab.sym} 660 290 0 0 {name=x2}
C {lab_wire.sym} 450 260 0 0 {name=p7 sig_type=std_logic lab=vbg_unbuf}
C {lab_pin.sym} 600 220 0 1 {name=p4 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 600 360 0 1 {name=p8 sig_type=std_logic lab=vss}
C {lab_wire.sym} 450 340 0 0 {name=p1 sig_type=std_logic lab=ena_h}
C {ipin.sym} 150 300 0 0 {name=p2 lab=trim[15:0]}
C {ipin.sym} 150 330 0 0 {name=p3 lab=ena}
C {opin.sym} 710 290 0 0 {name=p5 lab=vbg}
C {iopin.sym} 560 410 1 0 {name=p9 lab=ibias2_1u}
C {iopin.sym} 170 400 1 0 {name=p10 lab=ibias1_250n}
C {iopin.sym} 150 240 2 0 {name=p11 lab=vdd}
C {iopin.sym} 150 260 2 0 {name=p12 lab=dvdd}
C {iopin.sym} 150 280 2 0 {name=p13 lab=dvss}
C {iopin.sym} 150 360 2 0 {name=p14 lab=vss}
