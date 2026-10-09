v {xschem version=3.4.6 file_version=3.3}
G {}
K {}
V {}
S {}
E {}
N 70 240 70 290 {
lab=avss}
N 70 210 140 210 {
lab=avss}
N 140 210 140 290 {
lab=avss}
N 70 290 140 290 {
lab=avss}
N -100 290 70 290 {
lab=avss}
N -10 -140 -10 -100 {
lab=avdd}
N -10 -140 190 -140 {
lab=avdd}
N 190 -140 190 -100 {
lab=avdd}
N 190 -70 300 -70 {
lab=avdd}
N 300 -140 300 -70 {
lab=avdd}
N 190 -140 300 -140 {
lab=avdd}
N -120 -70 -10 -70 {
lab=avdd}
N -120 -140 -120 -70 {
lab=avdd}
N -120 -140 -10 -140 {
lab=avdd}
N 50 -70 150 -70 {
lab=outn}
N -10 -20 -10 -0 {
lab=outn}
N -10 -20 50 -20 {
lab=outn}
N 50 -70 50 -20 {
lab=outn}
N 190 -20 190 0 {
lab=out}
N 190 -20 340 -20 {
lab=out}
N 140 30 190 30 {
lab=avss}
N -10 60 -10 80 {
lab=vcom}
N 70 80 190 80 {
lab=vcom}
N 190 60 190 80 {
lab=vcom}
N 70 80 70 100 {
lab=vcom}
N -100 210 30 210 {
lab=nbias}
N -100 30 -50 30 {
lab=inp}
N 230 30 270 30 {
lab=inn}
N 140 30 140 130 {
lab=avss}
N 140 130 140 210 {
lab=avss}
N 70 160 70 180 {
lab=#net1}
N -100 130 30 130 {
lab=ena}
N 70 130 140 130 {
lab=avss}
N -10 -40 -10 -20 {
lab=outn}
N 30 -70 50 -70 {
lab=outn}
N 190 -40 190 -20 {
lab=out}
N -10 80 70 80 {
lab=vcom}
N -10 30 140 30 {
lab=avss}
C {gf180mcu_fd_pr/nfet_06v0.sym} 50 210 0 0 {name=M1
w=10u
l=1u
ng=10
m=1
model=nfet_06v0
spiceprefix=X
}
C {gf180mcu_fd_pr/pfet_06v0.sym} 170 -70 0 0 {name=M2
w=5u
l=0.5u
ng=5
m=1
model=pfet_06v0
spiceprefix=X
}
C {gf180mcu_fd_pr/pfet_06v0.sym} 10 -70 0 1 {name=M3
w=5u
l=0.5u
ng=5
m=1
model=pfet_06v0
spiceprefix=X
}
C {gf180mcu_fd_pr/nfet_06v0.sym} -30 30 0 0 {name=M4
w=10u
l=0.5u
ng=10
m=1
model=nfet_06v0
spiceprefix=X
}
C {gf180mcu_fd_pr/nfet_06v0.sym} 210 30 0 1 {name=M5
w=10u
l=0.5u
ng=10
m=1
model=nfet_06v0
spiceprefix=X
}
C {devices/ipin.sym} -100 30 0 0 {name=p1 lab=inp}
C {devices/ipin.sym} -100 210 0 0 {name=p2 lab=nbias}
C {devices/ipin.sym} 270 30 0 1 {name=p5 lab=inn}
C {devices/opin.sym} 340 -20 0 0 {name=p6 lab=out}
C {devices/iopin.sym} -120 -140 0 1 {name=p3 lab=avdd}
C {devices/iopin.sym} -100 290 0 1 {name=p4 lab=avss}
C {gf180mcu_fd_pr/nfet_06v0.sym} 50 130 0 0 {name=M6
w=10u
l=0.5u
ng=10
m=1
model=nfet_06v0
spiceprefix=X
}
C {devices/ipin.sym} -100 130 0 0 {name=p7 lab=ena}
C {devices/lab_wire.sym} 20 80 0 1 {name=p8 sig_type=std_logic lab=vcom}
C {lab_pin.sym} 50 -20 0 1 {name=p9 sig_type=std_logic lab=outn}
