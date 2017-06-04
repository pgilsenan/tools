#!/bin/bash

# cron script to reduce screen brightness throughout the day

CURRENT_HOUR="$(date +'%H')"
B_PATH=/sys/class/backlight/intel_backlight/brightness

WORK=500


# WORK HOURS --> 06:00 < TIME < 16:00
if [ $CURRENT_HOUR -gt 6 -a $CURRENT_HOUR -lt 16 ]
then
    echo $WORK >  $B_PATH
fi