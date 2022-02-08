#!/bin/python3

import sys
import os
import time
from reprint import output
import subprocess
import importlib
import final

subprocess.Popen(["node" , "navdataTest.js", "&"])
numVar = 5 #The number of values we want to track
subprocess.Popen(["./droneStatus.sh", "{}".format(numVar)])

with output(initial_len=numVar, interval=500) as output_lines:
    while True:
        importlib.reload(final)
        subprocess.Popen(["./droneStatus.sh", "{}".format(numVar)])
        output_lines[0] = "Battery: {}".format(final.Battery)
        output_lines[1] = "Altitude: {}".format(final.Altitude)
        output_lines[2] = "Pitch: {}".format(final.Pitch)
        output_lines[3] = "Roll: {}".format(final.Roll)
        output_lines[4] = "Yaw: {}".format(final.Yaw)
        time.sleep(.5)
