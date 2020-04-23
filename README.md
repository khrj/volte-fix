# VoLTE-Fix
Fixes VoLTE on 32-bit GSI Treble Roms

# Usage
## Using install.sh
Run
```./install.sh twrp```
if you've booted into twrp, or
```./install.sh system```
if you're rooted and have booted into android

## Manually
Copy the ims folder to /system/priv-app and copy android.hardware.telephony.ims.xml to /system/etc/permissions
