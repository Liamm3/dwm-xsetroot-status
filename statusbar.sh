#!/bin/bash

while true; do
    DATE=$(/bin/date +"%a %b %d %H:%M")
    VOLUME=$(amixer get Master | awk '$0~/%/{print $4}' | tr -d '[]%')
    KEYMAP=$(xkblayout-state print "%s")
    RAM_USAGE=$(free -m | awk 'NR==2{printf "%.d MiB", $3 }')

    ROOT=" [  $RAM_USAGE ] [  $KEYMAP ] [  $VOLUME% ] $DATE"
    xsetroot -name "$ROOT"
    sleep 2
done
