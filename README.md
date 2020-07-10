# VoLTE-Fix
Fixes Qualcomm VoLTE on all GSI Treble Roms

> Important: Before you open an issue / ask how to do something, read the for dummies section at the bottom of the README

Featured on [XDA](https://www.xda-developers.com/how-to-enable-volte-qualcomm-devices-running-generic-system-images-gsis/)
# Ways to install

## 1. Using the flashable zip (Simplest)

Go to [releases](https://github.com/KhushrajRathod/VoLTE-Fix/releases) and download the installer zip.
Then simply flash using any custom recovery such as TWRP

### Note:

If your Recovery cannot decrypt data, then you need to have root access. Set props manually using

```
setprop persist.dbg.allow_ims_off 1
setprop persist.dbg.volte_avail_ovr 1
setprop persist.dbg.vt_avail_ovr 1
setprop persist.dbg.wfc_avail_ovr 1
setprop persist.sys.phh.ims.caf true
```

**AFTER** booting into system

## 2. Using the Installer Script
> Note: If you're not rooted or are using magisk (that's systemless so it doesn't work), boot into TWRP, and mount system as r/w

Run ``bash ./install.sh`` (uses adb, script needs to be run on a computer)

## 3. Manually
Push the ims folder found inside the 32bit / 64bit folder
> Note: If you're using a version older than AOSP v216, you'll also have to push the android.hardware.telephony.ims.xml to /system/etc/permissions. The script and the zip will automatically add it for you

Set the following properties using setprop

- persist.dbg.allow_ims_off to 1
- persist.dbg.volte_avail_ovr to 1
- persist.dbg.vt_avail_ovr to 1
- persist.dbg.wfc_avail_ovr to 1
- persist.sys.phh.ims.caf to true

### For a 64 bit device (arm64)
Copy the 64bit/ims (don't copy the 64bit folder, only the ims folder inside it) folder to /system/priv-app

### For a 32 bit device (arm & a64)
Copy the 32bit/ims (don't copy the 32bit folder, only the ims folder inside it) folder to /system/priv-app

# Ways to uninstall

## 1. Using the flashable zip (Simplest)

Go to [releases](https://github.com/KhushrajRathod/VoLTE-Fix/releases) and download the uninstaller zip.
Then simply flash using any custom recovery such as TWRP

## 2. Using the Uninstaller Script
> Note: If you're not rooted or are using magisk (that's systemless so it doesn't work), boot into TWRP, and mount system as r/w

Run ``bash ./uninstall.sh``

## 3. Manually
Set the following properties using setprop

- persist.dbg.allow_ims_off to 0
- persist.dbg.volte_avail_ovr to 0
- persist.dbg.vt_avail_ovr to 0
- persist.dbg.wfc_avail_ovr to 0
- persist.sys.phh.ims.caf to false

Remove the ims folder from /system/priv-app/

# For dummies

- [What is adb?](https://www.xda-developers.com/what-is-adb/)
- Where should I download adb and fastboot without downloading the entire android sdk? Downloads: [Windows](https://dl.google.com/android/repository/platform-tools-latest-windows.zip), [macOS](https://dl.google.com/android/repository/platform-tools-latest-darwin.zip), [Linux](https://dl.google.com/android/repository/platform-tools-latest-linux.zip) (These links are maintained by google, you should always get the latest versions)
- How do I download this repository? Use the download button above or just click [here](https://github.com/KhushrajRathod/VoLTE-Fix/archive/master.zip).
