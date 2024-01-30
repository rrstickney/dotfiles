#!/bin/bash
# Detect if external monitor is connected for desk mode
if xrandr | grep "DP-3 connected"; then
    export MONITOR=DP-3
    polybar desk -c ~/.config/polybar/desk.ini 2>&1 | tee -a /var/log/polybar/desk.log &
else
    export MONITOR=eDP-1
    polybar mobile -c ~/.config/polybar/mobile.ini 2>&1 | tee -a /var/log/polybar/desk.log &
fi


## Old Config ##
# #!/usr/bin/env sh

# ## Add this to your wm startup file.

# # Terminate already running bar instances
# killall -q polybar

# ## Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# ## Launch

# ## Left bar
# polybar log -c ~/.config/polybar/current.ini &
# polybar secondary -c ~/.config/polybar/current.ini &

# ## Right bar
# polybar top -c ~/.config/polybar/current.ini &
# polybar primary -c ~/.config/polybar/current.ini &

# ## Center bar
# polybar primary -c ~/.config/polybar/workspace.ini &


# ~/.config/bspwm/bspwmrc
