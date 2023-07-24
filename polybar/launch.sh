#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

polybar -c ~/.config/polybar/config.ini main 2>&1 | tee -a /tmp/polybar.log & disown
polybar -c ~/.config/polybar/config.ini multi 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
