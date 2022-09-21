#!/bin/sh

#Workstyle
nm-applet &

# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon &

#nitrogen wallpapers
nitrogen --restore &

#Start Conky
start_conky &

#Clipit

clipit &

#picom

picom -b
