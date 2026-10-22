#!/bin/sh
#
# Run LVS on the class-AB amplifier buffer (3.3V)
#
export PDK_ROOT=${PDK_ROOT:-/usr/share/pdk}
export PDK=${PDK:-gf180mcuD}

project=gf180mcu_ocd_ip__classab_buffer

export NETGEN_COLUMNS=75

cat > netgen.tcl << EOF
# Tcl script for project ${project} LVS
set circuit1 [readnet spice ../netlist/layout/${project}.spice]
set circuit2 [readnet spice ../netlist/schematic/${project}.spice]
lvs "\$circuit1 ${project}" "\$circuit2 ${project}" \
${PDK_ROOT}/${PDK}/libs.tech/netgen/${PDK}_setup.tcl \
comp_${project}.out
EOF

netgen -batch source netgen.tcl
rm netgen.tcl
echo "Done!"
exit 0

