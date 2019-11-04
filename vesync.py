from pyvesync import VeSync
import pandas as pd
import sys

config = pd.read_csv("vesync.config")

manager = VeSync(config.email[0], config.password[0])
manager.login()
manager.update()

for out in range(len(manager.outlets)):
    if sys.argv[1] in str.lower(str(manager.outlets[out])):
        name = out
        
switch = manager.outlets[name]

if sys.argv[2] == "on":
    switch.turn_on()
elif sys.argv[2] == "off":
    switch.turn_off()
