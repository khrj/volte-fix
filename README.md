# VoLTE-Fix
Fixes Qualcomm VoLTE on all GSI Treble Roms

# Usage
## Using install.sh (only for a64 and arm64 devices)
> Note: If you're not rooted, boot into TWRP, and mount system as r/w

Run
``./install.sh``

## Manually
### For a64 or arm64
Copy the binder64/ims folder to /system/priv-app and copy android.hardware.telephony.ims.xml to /system/etc/permissions

### For arm
Copy the binder32/ims folder to /system/priv-app and copy android.hardware.telephony.ims.xml to /system/etc/permissions
