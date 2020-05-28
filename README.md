# VoLTE-Fix
Fixes Qualcomm VoLTE on all GSI Treble Roms

# Usage
## Using the Installer Scripts
### Via adb
> Note: If you're not rooted, boot into TWRP, and mount system as r/w

Run

``./install-adb.sh 32`` if you're on a arm device

``./install-adb.sh 64`` if you're on a a64 or arm64 device

### Locally on a terminal emulator (untested)

Run

``./install-local.sh 32`` if you're on a arm device

``./install-local.sh 64`` if you're on a a64 or arm64 device

## Manually
Set the following properties using setprop

- persist.dbg.allow_ims_off to 1
- persist.dbg.volte_avail_ovr to 1
- persist.dbg.vt_avail_ovr to 1
- persist.dbg.wfc_avail_ovr to 1
- persist.sys.phh.ims.caf to true

### For a64 or arm64
Copy the binder64/ims (don't copy the binder64 folder, only the ims folder inside it) folder to /system/priv-app

### For arm
Copy the binder32/ims (don't copy the binder32 folder, only the ims folder inside it) folder to /system/priv-app

# For dummies

- [What is adb?](https://www.xda-developers.com/what-is-adb/)
- Where should I download adb and fastboot without downloading the entire android sdk? Downloads: [Windows](https://dl.google.com/android/repository/platform-tools-latest-windows.zip), [macOS](https://dl.google.com/android/repository/platform-tools-latest-darwin.zip), [Linux](https://dl.google.com/android/repository/platform-tools-latest-linux.zip) (These links are maintained by google, you should always get the latest versions)
- How do I download this repository? Use the download button above or just click [here](https://github.com/KhushrajRathod/VoLTE-Fix/archive/master.zip).
- How do I install the apks? You need to run install.sh. See how to run a shell script on [windows](https://www.thewindowsclub.com/how-to-run-sh-or-shell-script-file-in-windows-10), [macOS/Linux](https://askubuntu.com/a/38670)
