#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar on all monitors, using default config location ~/.config/polybar/config

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        if [ $m == 'DP-0' ]
        then
            MONITOR=$m polybar --reload 1440pbar &
        else
            MONITOR=$m polybar --reload mybar &
        fi
    done
else
    polybar --reload mybar &
fi

echo "Polybar launched..."
