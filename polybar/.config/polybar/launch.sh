#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bspwm
echo "---" | tee -a /tmp/polybar-bspwm.log 
polybar bspwm >>/tmp/polybar-bspwm.log 2>&1 &

echo "Bars launched..."