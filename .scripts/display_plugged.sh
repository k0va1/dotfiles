#!/bin/bash

# Get out of town if something errors
set -e

function wait_for_monitor {
    xrandr | grep DP1 | grep '\bconnected'
    while [ $? -ne 0 ]; do
            logger -t "waiting for 100ms"
            sleep 0.1
            xrandr | grep DP1 | grep '\bconnected'
    done
}

DP_STATUS=$(</sys/class/drm/card0-DP-1/status)  

if [ "connected" == "$DP_STATUS" ]; then  
  wait_for_monitor
  /usr/bin/xrandr --output eDP1 --mode 3000x2000 --pos 740x2520 --rotate normal --output DP1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --scale 1.5 --output DP2 --off --output HDMI1 --off
else  
  /usr/bin/xrandr --auto --output eDP1 --mode 3000x2000 --primary --output DP1 --off
fi

sleep 1
i3-msg restart

