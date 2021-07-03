#!/bin/sh

awk '{printf("Uptime %dd:%02d\n",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime > /tmp/uptime
