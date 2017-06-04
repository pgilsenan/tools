#!/bin/bash

# cron script to reduce screen brightness throughout the day

CURRENT_HOUR="$(date +'%H')"

# path to file storing brightness level
B_PATH=/sys/class/backlight/intel_backlight/brightness

# brightness levels
WORK=500
AFTERNOON=350
EVENING=250
NIGHT=100

# work hours = 06:00 - 16:00
if [ $CURRENT_HOUR -gt 6 -a $CURRENT_HOUR -lt 16 ]
then
    echo $WORK >  $B_PATH

# AFTERNOON hours = 16:00 - 19:00
elif [ $CURRENT_HOUR -gt 15 -a $CURRENT_HOUR -lt 19 ]
then
    echo $AFTERNOON >  $B_PATH

# EVENING hours = 19:00 - 21:00
elif [ $CURRENT_HOUR -gt 18 -a $CURRENT_HOUR -lt 21 ]
then
    echo $EVENING >  $B_PATH

# NIGHT hours = 21:00 - 06:00
else
    echo $NIGHT >  $B_PATH
fi