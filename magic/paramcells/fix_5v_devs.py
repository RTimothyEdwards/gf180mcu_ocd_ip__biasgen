#!/bin/env python3
#
# fix_5v_devs.py ---
#
# Correct for the use of "hv" device types where "mv" were intended
# but could not be made initially because the magic device generator
# script was prohibiting it.  The PDK is now fixed;  this is a one-
# time patch.

import os
import re
import sys
import glob

filelist = glob.glob('*.mag')

for file in filelist:
    newlines = []
    seen = False
    with open(file, 'r') as ifile:
        mlines = ifile.readlines()
    for line in mlines:
        newline = line.strip()
        newline = re.sub('hvpmos', 'mvpmos', newline)
        newline = re.sub('hvnmos', 'mvnmos', newline)
        newline = re.sub('gencell pfet_06v0', 'gencell pfet_05v0', newline)
        newline = re.sub('gencell nfet_06v0', 'gencell nfet_05v0', newline)
        newlines.append(newline)

    with open(file, 'w') as ofile:
        for line in newlines:
            print(line, file=ofile)

print('Done!')
sys.exit(0)
