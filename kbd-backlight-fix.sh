#!/bin/bash

# Set keyboard backlight brightness function
set_brightness() {
    case $1 in
        48)
            asusctl -k off
            ;;
        49)
            asusctl -k low
            ;;
        50)
            asusctl -k med
            ;;
        51)
            asusctl -k high
            ;;
    esac
}

if [ "${1}" == "pre" ]; then
    # Save current keyboard backlight brightness and turn it off
    asusctl -k | cut -d " " -f 5 > /tmp/kbd-brightness
    asusctl -k off
elif [ "${1}" == "post" ]; then
    # Read and set brightness value set before suspending
    if [[ -s "/tmp/kbd-brightness" ]]; then
        brightness=$(cat /tmp/kbd-brightness)
        set_brightness $brightness
        rm /tmp/kbd-brightness
    fi

    # Delay after wake-up
    sleep 0.35

    # Get brightness value (set before suspend or during the delay above)
    brightness=$(asusctl -k | cut -d " " -f 5)
    asusctl -k high  # Fix static brightness issue after wake-up

    # Set keyboard backlight brightness according to the previously read value 
    set_brightness $brightness
fi
