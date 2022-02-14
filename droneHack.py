#!/bin/python3


import subprocess
import os


os.system("clear")

header = "\033[1;96m" + "Parrot AR Drone Attack Framework" + "\033[0m"
authors = "\x1B[3m" + "     Developed for Capitol by Thomas Mahr and Valerie Kehrer" + "\x1B[0m"

print("\n\n\t\t\t\t\t" + header)
print("\n\t\t\t" + authors)


print("\n\n\nChecking installed software")
os.system("./checkInstalled.sh")


"""
Find drones in the area to try to connect
assuming for now that they are parrot AR drones
"""


