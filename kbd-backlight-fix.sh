#!/bin/bash

if [ "${1}" == "pre" ]; then
    # Add delay before sleep, so there is time to fully turn off the backlight
    sleep 1
elif [ "${1}" == "post" ]; then
    # Check if keyboard backlight brightness was set to off before suspending
    brightness=$(cat /sys/class/leds/asus::kbd_backlight/brightness)
    if [ $brightness -eq 0 ]; then
        # Fix static brightness issue after wake-up
        echo 3 > /sys/class/leds/asus::kbd_backlight/brightness  
        # Turn off keyboard backlight brightness
        echo 0 > /sys/class/leds/asus::kbd_backlight/brightness  
    fi
fi
