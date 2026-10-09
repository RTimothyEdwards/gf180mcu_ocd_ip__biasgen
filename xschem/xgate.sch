v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 100 -80 140 -80 {lab=out}
N 140 -0 140 90 {lab=out}
N 100 90 140 90 {lab=out}
N 10 -80 40 -80 {lab=in}
N 10 0 10 90 {lab=in}
N 10 90 40 90 {lab=in}
N -20 0 10 0 {lab=in}
N 10 -80 10 0 {lab=in}
N 140 -0 170 0 {lab=out}
N 140 -80 140 -0 {lab=out}
N -20 -50 70 -50 {lab=vdd}
N 70 -80 70 -50 {lab=vdd}
N -20 50 70 50 {lab=vss}
N 70 50 70 90 {lab=vss}
N 70 -150 70 -120 {lab=ena_b}
N 70 130 70 170 {lab=ena}
N 0 170 70 170 {lab=ena}
N 0 -150 70 -150 {lab=ena_b}
C {iopin.sym} 170 0 0 0 {name=p1 lab=out}
C {iopin.sym} -20 0 0 1 {name=p2 lab=in}
C {iopin.sym} -20 -50 0 1 {name=p3 lab=vdd}
C {iopin.sym} -20 50 0 1 {name=p4 lab=vss}
C {ipin.sym} 0 -150 0 0 {name=p5 lab=ena_b}
C {ipin.sym} 0 170 0 0 {name=p6 lab=ena}
C {gf180mcu_fd_pr/nfet_05v0.sym} 70 110 3 0 {name=M3
L=0.60u
W=2.0u
nf=1
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
C {gf180mcu_fd_pr/pfet_05v0.sym} 70 -100 1 0 {name=M4
L=0.50u
W=2.0u
nf=1
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
