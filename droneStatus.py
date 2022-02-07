#!/bin/python3

import sys
import os
import time
from reprint import output
import subprocess
import importlib
import final

subprocess.Popen(["node" , "navdataTest.js", "&"])

with output(initial_len=4, interval=1000) as output_lines:
    while True:
        importlib.reload(final)
        subprocess.Popen(["./droneStatus.sh"])
        output_lines[0] = "Battery: {}".format(final.Battery)
        output_lines[1] = "Pitch: {}".format(final.Pitch)
        output_lines[2] = "Roll: {}".format(final.Roll)
        output_lines[3] = "Yaw: {}".format(final.Yaw)
        time.sleep(1)
