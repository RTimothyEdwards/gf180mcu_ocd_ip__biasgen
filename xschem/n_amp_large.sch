v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {dummy devices} 490 20 0 0 0.3 0.3 {}
N 70 240 70 290 {
lab=avss}
N 70 210 140 210 {
lab=avss}
N 140 210 140 290 {
lab=avss}
N 70 290 140 290 {
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
N 190 60 190 80 {
lab=vcom}
N -100 30 -50 30 {
lab=inp}
N 230 30 270 30 {
lab=inn}
N 140 30 140 210 {
lab=avss}
N -10 -40 -10 -20 {
lab=outn}
N 30 -70 50 -70 {
lab=outn}
N 190 -40 190 -20 {
lab=out}
N 70 80 190 80 {
lab=vcom}
N -10 30 140 30 {
lab=avss}
N -120 290 70 290 {lab=avss}
N -220 240 -220 290 {lab=avss}
N -310 290 -220 290 {lab=avss}
N -310 210 -220 210 {lab=avss}
N -310 210 -310 290 {lab=avss}
N -150 210 40 210 {lab=#net1}
N -310 120 -260 120 {lab=ena}
N -220 160 -220 180 {lab=#net1}
N -220 120 -120 120 {lab=avss}
N -120 120 -120 290 {lab=avss}
N -220 290 -120 290 {lab=avss}
N -220 160 -150 160 {lab=#net1}
N -220 150 -220 160 {lab=#net1}
N -150 160 -150 210 {lab=#net1}
N -180 210 -150 210 {lab=#net1}
N -220 20 -220 90 {lab=ibias}
N 70 80 70 180 {lab=vcom}
N -10 80 70 80 {
lab=vcom}
N 520 -140 580 -140 {lab=avdd}
N 580 -140 580 -70 {lab=avdd}
N 520 -70 580 -70 {lab=avdd}
N 520 -140 520 -100 {lab=avdd}
N 460 -140 520 -140 {lab=avdd}
N 460 -70 480 -70 {lab=avdd}
N 460 -140 460 -70 {lab=avdd}
N 300 -140 460 -140 {lab=avdd}
N 460 -70 460 -40 {lab=avdd}
N 460 -40 520 -40 {lab=avdd}
N 140 290 530 290 {lab=avss}
N 530 240 530 290 {lab=avss}
N 530 210 630 210 {lab=avss}
N 630 210 630 290 {lab=avss}
N 530 290 630 290 {lab=avss}
N 530 140 530 180 {lab=avss}
N 440 140 530 140 {lab=avss}
N 440 140 440 290 {lab=avss}
N 440 210 490 210 {lab=avss}
C {devices/ipin.sym} -100 30 0 0 {name=p1 lab=inp}
C {devices/ipin.sym} 270 30 0 1 {name=p5 lab=inn}
C {devices/opin.sym} 340 -20 0 0 {name=p6 lab=out}
C {devices/iopin.sym} -120 -140 0 1 {name=p3 lab=avdd}
C {devices/iopin.sym} -310 290 0 1 {name=p4 lab=avss}
C {devices/ipin.sym} -310 120 0 0 {name=p7 lab=ena}
C {devices/lab_wire.sym} 20 80 0 1 {name=p8 sig_type=std_logic lab=vcom}
C {lab_pin.sym} 50 -20 0 1 {name=p9 sig_type=std_logic lab=outn}
C {devices/iopin.sym} -220 20 1 1 {name=p10 lab=ibias}
C {gf180mcu_fd_pr/pfet_05v0.sym} 170 -70 0 0 {name=M9
L=0.50u
W=10.0u
nf=10
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_05v0
spiceprefix=X
}
C {gf180mcu_fd_pr/nfet_05v0.sym} 50 210 0 0 {name=M10
L=0.60u
W=20.0u
nf=20
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {gf180mcu_fd_pr/nfet_05v0.sym} -240 120 0 0 {name=M1
L=0.60u
W=20.0u
nf=20
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {gf180mcu_fd_pr/nfet_05v0.sym} -200 210 0 1 {name=M6
L=0.60u
W=20.0u
nf=20
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {gf180mcu_fd_pr/nfet_05v0.sym} -30 30 0 0 {name=M4
L=0.60u
W=20.0u
nf=20
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {gf180mcu_fd_pr/nfet_05v0.sym} 210 30 0 1 {name=M5
L=0.60u
W=20.0u
nf=20
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {gf180mcu_fd_pr/pfet_05v0.sym} 10 -70 0 1 {name=M2
L=0.50u
W=10.0u
nf=10
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_05v0
spiceprefix=X
}
C {gf180mcu_fd_pr/pfet_05v0.sym} 500 -70 0 0 {name=M3
L=0.50u
W=1.0u
nf=1
m=6
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_05v0
spiceprefix=X
}
C {gf180mcu_fd_pr/nfet_05v0.sym} 510 210 0 0 {name=M7
L=0.60u
W=8.0u
nf=8
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
