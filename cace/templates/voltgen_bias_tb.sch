v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {CACE TEMPLATE: voltgen + class-AB buffer: bias stack headroom} -400 -60 0 0 0.4 0.4 {}
C {devices/code_shown.sym} -400 40 0 0 {name=s1 only_toplevel=false value=".option savecurrents
.option TEMP=CACE\{temperature\}

*** GF180MCU model setup.  This is NOT a renaming of the IHP lines it
*** replaces:  IHP ships one .lib file per device class (cornerMOShv,
*** cornerMOSlv, cornerRES ...), while GF180MCU puts every device class
*** in sm141064.ngspice as a named section, so the file is the same each
*** time and only the section changes.
***
*** design.ngspice must come FIRST and is easy to miss:  it defines
*** sw_stat_global, sw_stat_mismatch, mc_skew and fnoicor, which the
*** model sections reference over a hundred times but do not define
*** themselves.  Without it every model evaluates against undefined
*** parameters.
***
*** There is also no separate hv/lv MOS library here;  the one MOS
*** section covers the 3.3 V and the 5/6 V devices together.
***
*** CORNER COVERAGE IS NOT WHAT IT LOOKS LIKE.  The MOS sections
*** typical, ss, ff, sf and fs each skew ONLY the 03v3 devices;  all
*** five pull nfet_06v0_t and pfet_06v0_t, the TYPICAL 6 V models,
*** because no skewed 6 V models exist in this PDK.  So every 5/6 V
*** device in this block is at typical in every corner, and any part of
*** voltgen built from them does not move across the corner axis at all.
*** Keep that in mind when reading a corner sweep that looks suspiciously
*** flat:  it is the PDK, not the circuit.
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice diode_CACE\{corner_dio\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice res_CACE\{corner_res\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice mimcap_CACE\{corner_cap\}

.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.ref/gf180mcu_as_sc_mcu7t3v3/spice/gf180mcu_as_sc_mcu7t3v3.spice

*** The DUT.  CACE netlists it separately (schematic, layout, pex or
*** rcx, per --source) and only copies the SYMBOL into the run
*** directory, so xschem cannot expand it here and the instance line
*** would otherwise reference an unknown subckt.
.include CACE\{DUT_path\}

*** The DUT is voltgen.  The class-AB buffer is a SEPARATE cell that
*** lives beside it in chipalooza_frame, so it is included and
*** instantiated here rather than coming from CACE.  This testbench
*** reproduces the frame wiring exactly:  the buffer takes vout_unbuf as
*** its input, its output is tied to vout_buf, and its enable is the
*** level-shifted vgen_ena2_h that voltgen exports.
***
*** NOTE WHICH WRAPPER THIS IS.  classab_buffer_5v wraps
*** se_folded_cascode_np_ab_5v and is the one that belongs to voltgen,
*** which runs on the 5 V supply.  The plain classab_buffer wraps the
*** 3.3 V amplifier and belongs to the BANDGAP.  Both exist, they have
*** identical port lists, and including the wrong one here would
*** simulate 3.3 V devices on a 5 V rail without any complaint.
.include CACE\{root\}/netlist/schematic/gf180mcu_ocd_ip__classab_buffer_5v.spice

Vvss  vss  0    DC 0
Vdvss dvss 0    DC 0
Vvdd  vdd  vss  DC CACE\{Vdd\}
Vdvdd dvdd dvss DC CACE\{Vdvdd\}

*** Ideal reference, so the block is specified independently of the
*** bandgap.  Note it does not REJECT its reference, it scales it:
*** vout = (s+1)*vbg/(4-high), a gain of 0.25 to 2.67, so bandgap noise
*** and supply rejection are multiplied by up to 8.5 dB on the way to a
*** user project.  These numbers are the buffer, not the delivered bias.
Vvbg  vbg  vss  DC CACE\{Vbg\}

*** ibias1u_1 SOURCES into the feedback amplifier;  ibias1u_2 sinks from
*** the folded-cascode buffer, Ibias3 from the class-AB buffer.  In
*** ngspice I n+ n- value drives value from n+ to n- inside the source,
*** so it leaves at n-.  One condition each so they can be set
*** independently:  a disabled amplifier must have its bias REMOVED, but
*** the feedback amplifier has to stay biased throughout or the resistor
*** chain is not regulated at all.
I1 vss       ibias1u_1 DC CACE\{Ibias\}
I2 ibias1u_2 vss       DC CACE\{Ibias2\}
I3 cab_bias  vss       DC CACE\{Ibias3\}

*** Enables are SENSE-POSITIVE:  a high level enables.  Each amplifier
*** is disabled by a shunt pFET that pulls its bias node to vdd, which
*** is why a disabled amplifier must also have its bias current removed
*** -- otherwise the current source fights the shunt.
Vena  ena  dvss DC CACE[CACE\{Vdvdd\} * CACE\{Ena\}]
Vena1 ena1 dvss DC CACE[CACE\{Vdvdd\} * CACE\{Ena1\}]
Vena2 ena2 dvss DC CACE[CACE\{Vdvdd\} * CACE\{Ena2\}]
Vhigh high dvss DC CACE[CACE\{Vdvdd\} * CACE\{high\}]

*** s[2:0] is binary;  bracket expressions permit + - * / % ** and bare
*** math calls only, so each bit is extracted with % and divide.
Vs0 s[0] dvss DC CACE[CACE\{Vdvdd\} * (CACE\{s\} % 2)]
Vs1 s[1] dvss DC CACE[CACE\{Vdvdd\} * (((CACE\{s\} - (CACE\{s\} % 2)) / 2) % 2)]
Vs2 s[2] dvss DC CACE[CACE\{Vdvdd\} * (((CACE\{s\} - (CACE\{s\} % 4)) / 4) % 2)]

*** The shared output node, as in the frame:  both buffers drive it.
Cl    vout vss CACE\{Cload\}
Iload vout vss DC 0

Xdut dvdd dvss vdd s[2] s[1] s[0] vbg vss ibias1u_1 vout ibias1u_2 ena
+ vout_unbuf ena1 ena2 high vgen_ena2_h gf180mcu_ocd_ip__voltgen
Xcab vdd vout vout_unbuf vss cab_bias vgen_ena2_h
+ gf180mcu_ocd_ip__classab_buffer_5v

.control
save all
*** Does each bias pin ACCEPT the current it is given?  A stack that
*** cannot pass the intended current saturates, the external bias loses
*** control, and the amplifier runs at whatever its own stack delivers
*** -- invisible in every performance measurement.  Both amplifiers here
*** were in that state in the IHP original before the enable switch was
*** removed from their bias stacks, so this is a regression test carried
*** across to the port rather than a new check.
***
*** Sink pins are pulled down by an nstack and must stay ABOVE ~0.6 V;
*** the source pin is driven by a pstack and must stay BELOW vdd-0.6 V.
*** Values cross between sweeps as shell variables, since each analysis
*** lands in its own plot.
dc I1 0.2u 4u 10n
meas dc a1 find v(ibias1u_1) at=CACE\{Ibias\}
meas dc a2 find v(ibias1u_1) at=CACE[2 * CACE\{Ibias\}]
set va1 = $&a1
set va2 = $&a2
dc I2 0.2u 4u 10n
meas dc b1 find v(ibias1u_2) at=CACE\{Ibias\}
meas dc b2 find v(ibias1u_2) at=CACE[2 * CACE\{Ibias\}]
set vb1 = $&b1
set vb2 = $&b2
dc I3 0.2u 4u 10n
meas dc c1 find v(cab_bias) at=CACE\{Ibias3\}
meas dc c2 find v(cab_bias) at=CACE[2 * CACE\{Ibias3\}]
set vc1 = $&c1
set vc2 = $&c2
echo $va1 $va2 $vb1 $vb2 $vc1 $vc2 > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
