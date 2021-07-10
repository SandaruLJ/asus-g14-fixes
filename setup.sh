#!/bin/bash

# Check for root permissions
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root"
    exit
fi

echo "Installing fixes..."

# Touchpad DWT
cp local-overrides.quirks /etc/libinput/local-overrides.quirks
# Touchpad Fuzz
cp 99-touchpad-fuzz-override.hwdb /etc/udev/hwdb.d/99-touchpad-fuzz-override.hwdb
# Keyboard Backlight
cp kbd-backlight-fix.sh /usr/lib/systemd/system-sleep/kbd-backlight-fix
chmod +x /usr/lib/systemd/system-sleep/kbd-backlight-fix

echo "..done. The changes will take effect after a restart."
