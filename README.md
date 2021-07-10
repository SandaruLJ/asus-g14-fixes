# Linux Fixes for ASUS ROG Zephyrus G14 2020
## Getting Started
Clone this repo and move into it. Then you can continue with the [automatic](#automatic-setup) or [manual](#manual-setup) setup.
```bash
git clone https://github.com/SandaruLJ/asus-g14-fixes.git
cd asus-g14-fixes
```
## Automatic Setup
Make the setup script executable and ***run it as root***.
```bash
chmod +x setup.sh
./setup.sh
```
## Manual Setup
**Note:** *Every command below should be executed with root permissions.*
- **Touchpad DWT** 

  Disable touchpad when typing.
```bash
cp local-overrides.quirks /etc/libinput/local-overrides.quirks
```
- **Touchpad Fuzz**

  Set touchpad fuzz to 8. This will fix the touchpad jittering.
```bash
cp 99-touchpad-fuzz-override.hwdb /etc/udev/hwdb.d/99-touchpad-fuzz-override.hwdb
```
- **Keyboard Backlight**

  Fix keyboard backlight not turning off completely when in suspend, and staying at max after resuming.
```bash
cp kbd-backlight-fix.sh /usr/lib/systemd/system-sleep/kbd-backlight-fix
chmod +x /usr/lib/systemd/system-sleep/kbd-backlight-fix
```
