#!/bin/python3

import sys
import time
from reprint import output


with output(initial_len=4, interval=1000) as output_lines:
    i = 0
    while True:
        output_lines[0] = "1: {}".format(i)
        output_lines[1] = "2: {}".format(i+1)
        output_lines[2] = "3: {}".format(i+2)
        output_lines[3] = "4: {}".format(i+3)
        i+=4
