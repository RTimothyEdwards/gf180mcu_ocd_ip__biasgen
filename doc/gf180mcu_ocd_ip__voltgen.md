# gf180mcu_ocd_ip__voltgen

- Description: Tapped-resistor voltage bias generator, GF180MCU port of the IHP voltgen_v3:  one on-board folded-cascode output buffer, plus an unbuffered output taken to an external class-AB buffer that sits beside it in chipalooza_frame.

- PDK: gf180mcuD

## Authorship

- Designer: R. Timothy Edwards
- Company: Open Circuit Design, LLC
- Created: October 8, 2026
- License: Apache 2.0
- Last modified: None

## Pins

- vdd
  + Description: Analog supply.  Nominally 5 V;  nothing in this datasheet is specced, run or measured above 5.5 V (5 V + 10 %).

  + Direction: inout
  + Type: power
  + Vmin: 3.0
  + Vmax: 5.5
- vss
  + Description: Analog ground
  + Direction: inout
  + Type: ground
- dvdd
  + Description: 3.3 V digital supply for the enables and the tap select
  + Direction: inout
  + Type: power
  + Vmin: 3.0
  + Vmax: 3.6
- dvss
  + Description: Digital ground
  + Direction: inout
  + Type: ground
- ena
  + Description: Master enable, active high
  + Direction: input
  + Type: digital
- ena1
  + Description: Enable the on-board folded-cascode buffer, active high
  + Direction: input
  + Type: digital
- ena2
  + Description: Enable the external class-AB buffer, active high.  Level shifted inside this cell and exported as vgen_ena2_h.

  + Direction: input
  + Type: digital
- high
  + Description: Range select.  0 gives vbg/4 steps, 1 gives vbg/3 steps. high = 1 IS VALID ONLY ON A 5 V SUPPLY -- see the note above the parameters.  May become a 2-bit range select, giving a low and a high range for 3.3 V and a separate pair for 5 V;  if it does, the parameter split below becomes an enumeration over that field instead of over two supplies.

  + Direction: input
  + Type: digital
- s[2:0]
  + Description: Tap select, binary, 0 to 7
  + Direction: input
  + Type: digital
- vbg
  + Description: Bandgap reference input, nominally 1.2 V
  + Direction: input
  + Type: signal
- ibias1u_1
  + Description: 1 uA bias SOURCE for the feedback amplifier
  + Direction: inout
  + Type: signal
- ibias1u_2
  + Description: 1 uA bias SINK for the folded-cascode buffer
  + Direction: inout
  + Type: signal
- vout_buf
  + Description: Folded-cascode buffered output.  Tied in chipalooza_frame to the output of the external class-AB buffer.

  + Direction: output
  + Type: signal
- vout_unbuf
  + Description: Unbuffered resistor tap, taken to the external class-AB buffer. High impedance:  any load on it is an uncorrected error, since it sits outside the feedback loop that regulates the chain.

  + Direction: output
  + Type: signal
- vgen_ena2_h
  + Description: Level-shifted ena2, for the external class-AB buffer
  + Direction: output
  + Type: digital

## Default Conditions

- corner
  + Display: Corner
  + Description: MOS process corner.  Skews the 03v3 devices only;  the 5/6 V devices have no skewed models in this PDK and stay at typical.

  + Typical: typical
- corner_res
  + Display: Resistor corner
  + Description: Matters more here than in most blocks:  the output is set by ratios along a tapped ppolyf_u chain, so the ratio tracks but the absolute value moves the chain current and the loop gain with it.

  + Typical: typical
- corner_cap
  + Display: Capacitor corner
  + Description: MIM capacitor corner
  + Typical: typical
- corner_dio
  + Display: Diode corner
  + Description: Antenna tie-downs on the digital inputs only
  + Typical: typical
- temperature
  + Display: Temperature
  + Unit: °C
  + Typical: 27
- Vdd
  + Display: Analog supply
  + Description: Nominally 5 V in this process.  Enumerated over 3.3 and 5.0 where the difference matters, since both output buffers are built from 5 V-capable devices and must also work on a 3.3 V supply.

  + Unit: V
  + Typical: 5.0
- Vdvdd
  + Display: Digital supply
  + Description: 3.3 V here, not the 1.2 V of the IHP original
  + Unit: V
  + Typical: 3.3
- Vbg
  + Display: Reference voltage
  + Description: Ideal bandgap reference presented to vbg
  + Unit: V
  + Typical: 1.2
- Ibias
  + Display: Feedback amp bias
  + Description: Bias SOURCE into ibias1u_1.  Plain numeric rather than 1u because bracket expressions go through safe_eval, which reads 1u as a malformed Python literal rather than a SPICE suffix.

  + Unit: A
  + Typical: 1e-6
- Ibias2
  + Display: Cascode buffer bias
  + Description: Bias SINK from ibias1u_2.  Set to 0 when ena1 is 0.
  + Unit: A
  + Typical: 1e-6
- Ibias3
  + Display: Class-AB buffer bias
  + Description: Bias SINK from the class-AB buffer.  Set to 0 when ena2 is 0.
  + Unit: A
  + Typical: 1e-6
- Ena
  + Display: Master enable
  + Typical: 1
- Ena1
  + Display: Cascode buffer enable
  + Typical: 1
- Ena2
  + Display: Class-AB buffer enable
  + Typical: 1
- Istep
  + Display: Load step
  + Description: Load current step for the settling parameter.  Kept to 100 nA because that is inside what this buffer can drive:  it is class A at 1 uA, and the +/-1% load limit is a few hundred nA.  Plain numeric for the same reason as Ibias.

  + Unit: A
  + Typical: 100e-9
- Cload
  + Display: Load capacitance
  + Description: Stands in for the shared vbias trunk and its 18 slot switches
  + Unit: F
  + Typical: 1p
- s
  + Display: Tap select
  + Typical: 3
- high
  + Display: Range select
  + Typical: 0

## Symbol

![Symbol of gf180mcu_ocd_ip__voltgen](gf180mcu_ocd_ip__voltgen_symbol.svg)

## Schematic

![Schematic of gf180mcu_ocd_ip__voltgen](gf180mcu_ocd_ip__voltgen_schematic.svg)

## Layout

![Layout of gf180mcu_ocd_ip__voltgen with white background](gf180mcu_ocd_ip__voltgen_w.png)
![Layout of gf180mcu_ocd_ip__voltgen with black background](gf180mcu_ocd_ip__voltgen_b.png)
