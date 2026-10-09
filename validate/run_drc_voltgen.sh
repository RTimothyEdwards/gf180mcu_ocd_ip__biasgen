#!/bin/bash
#
# Run klayout DRC on the voltage bias generator
#
export PDK_ROOT=${PDK_ROOT:-/usr/share/pdk}
export PDK=${PDK:-gf180mcuD}

export PROJECT=gf180mcu_ocd_ip__voltgen

klayout -b -zz -r ${PDK_ROOT}/${PDK}/libs.tech/klayout/tech/drc/${PDK}.drc -rd input=../gds/${PROJECT}.gds.gz -rd report=../validate/${PROJECT}.lyrdb -rd feol=True -rd beol=True -rd conn_drc=True -rd wedge=True -rd run_mode=deep -rd thr=16 -rd topcell=${PROJECT}

echo "Done!"
exit 0
