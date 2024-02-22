#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar on all monitors, using default config location ~/.config/polybar/config
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        # Launch laptop bar if on laptop
        if [ "$(cat /etc/hostname)" = "deathstar" ]; then
            MONITOR=$m polybar --reload laptop &
            continue
        fi

        # Put main bar on middle monitor
        if [ $m == 'DP-0' ]; then
            MONITOR=$m polybar --reload 1440pbar &
        else
            MONITOR=$m polybar --reload mybar &
        fi
    done
else
    polybar --reload mybar &
fi

echo "Polybar launched..."
