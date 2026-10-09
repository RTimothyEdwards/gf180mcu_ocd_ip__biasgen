#!/bin/sh
#
# Run LVS on the bandgap
#
export PDK_ROOT=${PDK_ROOT:-/usr/share/pdk}
export PDK=${PDK:-gf180mcuD}

project=gf180mcu_ocd_ip__biasgen2

export NETGEN_COLUMNS=75

cat > netgen.tcl << EOF
# Tcl script for project ${project} LVS
set circuit1 [readnet spice ../netlist/layout/${project}.spice]
set circuit2 [readnet spice ${PDK_ROOT}/${PDK}/libs.ref/gf180mcu_as_sc_mcu7t5v0/spice/gf180mcu_as_sc_mcu7t5v0.spice]
readnet ../netlist/schematic/${project}.spice \$circuit2
lvs "\$circuit1 ${project}" "\$circuit2 ${project}" \
${PDK_ROOT}/${PDK}/libs.tech/netgen/${PDK}_setup.tcl \
comp_${project}.out -noflatten=noflat.txt
EOF

netgen -batch source netgen.tcl
rm netgen.tcl
echo "Done!"
exit 0

