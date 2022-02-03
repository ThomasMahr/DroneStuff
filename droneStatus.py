#!/bin/python3

import sys
import os
import time
from reprint import output
import subprocess

subprocess.Popen(["node" , "navdataTest.js", "&"])

with output(initial_len=4, interval=1000) as output_lines:
    while True:
        from finalValues import *
        subprocess.Popen(["./droneStatus.sh"])
        output_lines[0] = "Battery: {}".format(Battery)
        output_lines[1] = "Pitch: {}".format(Pitch)
        output_lines[2] = "Roll: {}".format(Roll)
        output_lines[3] = "Yaw: {}".format(Yaw)
