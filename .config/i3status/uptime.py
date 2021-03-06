#!/bin/python3

import math
import threading

days = 0
hours = 0
minutes = 0

def format_uptime(ms):
    minutes = math.floor(ms / 60)
    hours = math.floor(minutes / 60)
    minutes = minutes % 60
    days = math.floor(hours / 24)
    hours = hours % 24

    return f"Uptime: {days}d {hours}h {minutes}m \n"

def get_uptime():
    with open("/proc/uptime", "r") as f:
        uptime_seconds = float(f.readline().split()[0])

    return uptime_seconds

def write_uptime_file():
    threading.Timer(1, write_uptime_file).start()
    with open("/tmp/uptime", "w") as f:
        f.write(format_uptime(get_uptime()))
        f.close()

write_uptime_file()
