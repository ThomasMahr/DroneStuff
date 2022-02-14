#!/bin/python3


import subprocess
import os


os.system("clear")

header = "\033[1;96m" + "Parrot AR Drone Attack Framework" + "\033[0m"
authors = "\x1B[3m" + "     Developed for Capitol by Thomas Mahr and Valerie Kehrer" + "\x1B[0m"

cols = int(os.popen("tput cols").read())

print("\n", header.rjust(int(len(header) + int(cols/3)), " "), "\n")
print(authors.rjust(int(len(authors) + int(cols/4) - 8), " "))

#print("\n\n\nChecking installed software")
#os.system("./checkInstalled.sh")


"""
Find drones in the area to try to connect
assuming for now that they are parrot AR drones
"""


