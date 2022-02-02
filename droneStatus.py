#!/bin/python3

import sys
import time
from finalValues import *
from reprint import output
import subprocess


with output(initial_len=4, interval=0) as output_lines:
    while True:
        subprocess.Popen(['zsh', './droneStatus.sh'])
        output_lines[0] = "Battery: {}".format(battery)
        output_lines[1] = "Pitch: {}".format(pitch)
        output_lines[2] = "Roll: {}".format(roll)
        output_lines[3] = "Yaw: {}".format(yaw)
        time.sleep(1)
