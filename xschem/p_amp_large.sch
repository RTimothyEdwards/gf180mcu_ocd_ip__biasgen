v {xschem version=3.4.6 file_version=3.3}
G {}
K {}
V {}
S {}
E {}
T {dummy devices} 980 350 0 0 0.3 0.3 {}
N 630 -140 630 -100 {lab=avdd}
N 630 -140 700 -140 {lab=avdd}
N 700 -140 700 -70 {lab=avdd}
N 630 -70 700 -70 {lab=avdd}
N 680 30 700 30 {lab=avdd}
N 700 -70 700 30 {lab=avdd}
N 550 80 550 110 {lab=#net1}
N 730 80 730 110 {lab=#net1}
N 680 140 730 140 {lab=avdd}
N 680 30 680 140 {lab=avdd}
N 550 140 680 140 {lab=avdd}
N 470 140 510 140 {lab=inp}
N 770 140 810 140 {lab=inn}
N 550 210 550 240 {lab=outn}
N 730 210 730 240 {lab=out}
N 640 270 690 270 {lab=outn}
N 640 210 640 270 {lab=outn}
N 590 270 640 270 {lab=outn}
N 550 210 640 210 {lab=outn}
N 550 170 550 210 {lab=outn}
N 460 270 550 270 {lab=avss}
N 460 270 460 330 {lab=avss}
N 730 330 830 330 {lab=avss}
N 830 270 830 330 {lab=avss}
N 730 270 830 270 {lab=avss}
N 730 300 730 330 {lab=avss}
N 550 330 730 330 {lab=avss}
N 550 300 550 330 {lab=avss}
N 460 330 550 330 {lab=avss}
N 730 210 810 210 {lab=out}
N 730 170 730 210 {lab=out}
N 490 -140 630 -140 {lab=avdd}
N 370 -70 420 -70 {lab=avdd}
N 370 -140 370 -70 {lab=avdd}
N 340 -140 370 -140 {lab=avdd}
N 420 -140 420 -100 {lab=avdd}
N 370 -140 420 -140 {lab=avdd}
N 470 -70 590 -70 {lab=#net2}
N 630 80 730 80 {lab=#net1}
N 420 -20 420 -0 {lab=#net2}
N 320 30 380 30 {lab=ena_b}
N 420 30 490 30 {lab=avdd}
N 490 -140 490 30 {lab=avdd}
N 420 -140 490 -140 {lab=avdd}
N 470 -70 470 -20 {lab=#net2}
N 460 -70 470 -70 {lab=#net2}
N 420 -20 470 -20 {lab=#net2}
N 420 -40 420 -20 {lab=#net2}
N 420 60 420 110 {lab=ibias}
N 400 110 420 110 {lab=ibias}
N 630 -40 630 -20 {lab=#net3}
N 630 40 630 80 {lab=#net1}
N 550 80 630 80 {lab=#net1}
N 960 330 1030 330 {lab=avss}
N 1030 300 1030 330 {lab=avss}
N 1030 270 1120 270 {lab=avss}
N 1120 270 1120 330 {lab=avss}
N 1030 330 1120 330 {lab=avss}
N 1030 210 1030 240 {lab=avss}
N 960 210 1030 210 {lab=avss}
N 960 270 960 330 {lab=avss}
N 830 330 960 330 {lab=avss}
N 960 270 990 270 {lab=avss}
N 960 210 960 270 {lab=avss}
C {gf180mcu_fd_pr/pfet_06v0.sym} 610 -70 0 0 {name=M7
w=20u
l=1u
ng=20
m=1
model=pfet_06v0
spiceprefix=X
}
C {gf180mcu_fd_pr/pfet_06v0.sym} 530 140 0 0 {name=M9
w=20u
l=0.5u
ng=20
m=1
model=pfet_06v0
spiceprefix=X
}
C {gf180mcu_fd_pr/pfet_06v0.sym} 750 140 0 1 {name=M10
w=20u
l=0.5u
ng=20
m=1
model=pfet_06v0
spiceprefix=X
}
C {gf180mcu_fd_pr/nfet_06v0.sym} 710 270 0 0 {name=M11
w=10u
l=0.5u
ng=10
m=1
model=nfet_06v0
spiceprefix=X
}
C {gf180mcu_fd_pr/nfet_06v0.sym} 570 270 0 1 {name=M12
w=10u
l=0.5u
ng=10
m=1
model=nfet_06v0
spiceprefix=X
}
C {devices/iopin.sym} 340 -140 0 1 {name=p10 lab=avdd}
C {devices/iopin.sym} 460 330 0 1 {name=p11 lab=avss}
C {devices/ipin.sym} 320 30 0 0 {name=p13 lab=ena_b}
C {devices/ipin.sym} 470 140 0 0 {name=p14 lab=inp}
C {devices/ipin.sym} 810 140 0 1 {name=p15 lab=inn}
C {devices/opin.sym} 810 210 0 0 {name=p16 lab=out}
C {lab_pin.sym} 640 210 0 1 {name=p17 sig_type=std_logic lab=outn}
C {gf180mcu_fd_pr/pfet_06v0.sym} 440 -70 0 1 {name=M1
w=20u
l=1u
ng=20
m=1
model=pfet_06v0
spiceprefix=X
}
C {gf180mcu_fd_pr/pfet_06v0.sym} 400 30 0 0 {name=M2
w=20u
l=0.5u
ng=20
m=1
model=pfet_06v0
spiceprefix=X
}
C {devices/iopin.sym} 400 110 0 1 {name=p1 lab=ibias}
C {ammeter.sym} 630 10 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {gf180mcu_fd_pr/nfet_06v0.sym} 1010 270 0 0 {name=M3
w=2u
l=0.5u
ng=2
m=2
model=nfet_06v0
spiceprefix=X
}
