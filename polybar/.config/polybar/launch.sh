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
            echo "Launching laptop bar"
            MONITOR=$m polybar --reload -c laptop.ini laptop &
            exit
        fi

        # Put main bar on middle monitor
        if [ $m == 'DP-0' ]; then
            echo "Launching main bar"
            MONITOR=$m polybar --reload -c desktop-main.ini desktop-main &
        else
            echo "Launching aux bar"
            MONITOR=$m polybar --reload -c desktop-aux.ini desktop-aux &
        fi
    done
fi

echo "Polybar launched..."
