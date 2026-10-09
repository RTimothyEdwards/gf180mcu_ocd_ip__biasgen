
# CACE Summary for gf180mcu_ocd_ip__voltgen

**netlist source**: schematic

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| ibias1u_1 at 2x bias | ngspice              | vb1_2x               |               ​ |          ​ |            ​ |          ​ |        2.7 V |          ​ |   Skip 🟧    |
| ibias1u_2 at 2x bias | ngspice              | vb2_2x               |           0.6 V |          ​ |            ​ |          ​ |            ​ |          ​ |   Skip 🟧    |
| class-AB bias at 2x bias | ngspice              | vb3_2x               |           0.6 V |          ​ |            ​ |          ​ |            ​ |          ​ |   Skip 🟧    |
| Output error         | ngspice              | err_V                |         -150 mV |          ​ |            ​ |          ​ |        50 mV |          ​ |   Skip 🟧    |
| Line regulation      | ngspice              | linereg_VperV        |        -60 mV/V |          ​ |            ​ |          ​ |      60 mV/V |          ​ |   Skip 🟧    |
| Output error         | ngspice              | err_V                |         -150 mV |          ​ |            ​ |          ​ |        50 mV |          ​ |   Skip 🟧    |
| Line regulation      | ngspice              | linereg_VperV        |        -60 mV/V |          ​ |            ​ |          ​ |      80 mV/V |          ​ |   Skip 🟧    |
| Output error         | ngspice              | err_V                |         -200 mV |          ​ |            ​ |          ​ |        50 mV |          ​ |   Skip 🟧    |
| Output impedance     | ngspice              | rout_ohm             |               ​ |          ​ |            ​ |          ​ |        50 kΩ |          ​ |   Skip 🟧    |
| Source limit         | ngspice              | ilim_src             |          100 nA |          ​ |            ​ |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR at 1 kHz        | ngspice              | psrr_1kHz            |           25 dB |          ​ |            ​ |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR at 1 kHz        | ngspice              | psrr_1kHz            |           25 dB |          ​ |            ​ |          ​ |            ​ |          ​ |   Skip 🟧    |
| Settling excursion   | ngspice              | under_V              |               ​ |          ​ |            ​ |          ​ |       0.5 mV |   0.042 mV |   Pass ✅    |
| Overshoot            | ngspice              | over_V               |               ​ |          ​ |            ​ |          ​ |       0.1 mV |   0.000 mV |   Pass ✅    |
| Noise density at 1 kHz | ngspice              | n_1kHz_VrtHz         |               ​ |          ​ |            ​ |          ​ |  1000 nV/√Hz |          ​ |   Skip 🟧    |
| Total integrated noise | ngspice              | ntot_Vrms            |               ​ |          ​ |            ​ |          ​ |       500 µV |          ​ |   Skip 🟧    |
| Leakage at 1.2 V     | ngspice              | leak_1v2_A           |         -1.0 nA |          ​ |            ​ |          ​ |       1.0 nA |          ​ |   Skip 🟧    |
| Shunt resistance at mid-rail | ngspice              | rshunt_ohm           |          100 MΩ |          ​ |            ​ |          ​ |            ​ |          ​ |   Skip 🟧    |


## Plots
