#!/bin/env python3
#
# port_scaled.py ---
#
# Trivial work to port generated cells from IHP to GF180MCU.
# Initially this involves finding every cell with "magscale 1 2"
# and replacing it with "magscale 3 26", which is an ad-hoc average
# scaling for layout between the two processes.
#
# To do:
#
# Handle the property names and other keywords so that the
# generated cells actually convert between the processes.

import os
import sys
import glob

filelist = glob.glob('*.mag')
needscale = []

# Files with the IHP default "magscale 1 2" get it replaced with "3 26"

for file in filelist:
    newlines = []
    seen = False
    with open(file, 'r') as ifile:
        mlines = ifile.readlines()
    for line in mlines:
        newline = line.strip()
        if 'magscale' in line:
            seen = True
            if '1 2' in line:
                newline = 'magscale 3 26'
        newlines.append(newline)

    if not seen:
        needscale.append(file)
         
    with open(file, 'w') as ofile:
        for line in newlines:
            print(line, file=ofile)

#  Files without a "magscale" line get it added with "magscale 3 13"

for file in needscale:
    newlines = []
    with open(file, 'r') as ifile:
        mlines = ifile.readlines()
    for line in mlines:
        newlines.append(line.strip())
        if line.startswith('tech'):
            newlines.append('magscale 3 13')

    with open(file, 'w') as ofile:
        for line in newlines:
            print(line, file=ofile)

print('Done!')
sys.exit(0)
