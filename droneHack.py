#!/bin/python3


import subprocess
import os


os.system("clear")

header = "\033[1;96m" + "Parrot AR Drone Attack Framework" + "\033[0m"
authors = "\x1B[3m" + "Developed for Capitol by Thomas Mahr and Valerie Kehrer" + "\x1B[0m"

print("\n", header, "\n")
print(authors, "\n")

os.system("cat picture.txt")

"""
check if software is installed if the use wishes
"""

option = input("\nCheck to make sure all software is installed (y/n): ")

if option == 'y' or option == 'Y':
        print("Checking installed software")
        os.system("lib/checkInstalled.sh")

choice = -1



#while choice != 3:
#    print("")

"""
Find drones in the area to try to connect
assuming for now that they are parrot AR drones
"""


