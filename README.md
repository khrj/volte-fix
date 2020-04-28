# VoLTE-Fix
Fixes Qualcomm VoLTE on all GSI Treble Roms

# Note: All scripts to be run via adb on a computer

# Usage
## Using install.sh
> Note: If you're not rooted, boot into TWRP, and mount system as r/w

Run

``./install.sh 32`` if you're on a arm device

``./install.sh 64`` if you're on a a64 or arm64 device

## Manually
### For a64 or arm64
Copy the binder64/ims (don't copy the binder64 folder, only the ims folder inside it) folder to /system/priv-app and copy android.hardware.telephony.ims.xml to /system/etc/permissions

### For arm
Copy the binder32/ims (don't copy the binder32 folder, only the ims folder inside it) folder to /system/priv-app and copy android.hardware.telephony.ims.xml to /system/etc/permissions
