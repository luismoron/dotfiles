#!/bin/sh
xrandr --newmode "1600x900"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync
xrandr --addmode VGA-1 1600x900
xrandr --output LVDS-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output VGA-1 --mode 1600x900 --pos 1366x0 --rotate normal --output HDMI-1 --off --output DP-1 --off