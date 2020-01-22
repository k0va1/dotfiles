if xrandr | grep '^DP1'; then
  xrandr --output eDP1 --mode 3000x2000 --pos 740x2520 --rotate normal --output DP1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --scale 1.5 --output DP-2 --off --output HDMI1 --off
else
  xrandr --auto --output eDP1 --mode 3000x2000 --primary
fi
