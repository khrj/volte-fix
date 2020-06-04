# VoLTE-Fix
Fixes Qualcomm VoLTE on all GSI Treble Roms

# Ways to install

> Note: No matter what method you use, if you want to use VoLTE in a GSI that's based on any version older than AOSP v216, you'll also have to push the android.hardware.telephony.ims.xml to /system/etc/permissions

## 1. Using the flashable zip (Simplest)

Go to [releases](https://github.com/KhushrajRathod/VoLTE-Fix/releases) and download the zip.
Then simply flash using any custom recovery such as TWRP

## 2. Using the Installer Scripts
> Note: If you're not rooted or are using magisk (that's systemless so it doesn't work), boot into TWRP, and mount system as r/w

Run ``bash ./install.sh``

## 3. Manually
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

# For dummies

- [What is adb?](https://www.xda-developers.com/what-is-adb/)
- Where should I download adb and fastboot without downloading the entire android sdk? Downloads: [Windows](https://dl.google.com/android/repository/platform-tools-latest-windows.zip), [macOS](https://dl.google.com/android/repository/platform-tools-latest-darwin.zip), [Linux](https://dl.google.com/android/repository/platform-tools-latest-linux.zip) (These links are maintained by google, you should always get the latest versions)
- How do I download this repository? Use the download button above or just click [here](https://github.com/KhushrajRathod/VoLTE-Fix/archive/master.zip).
- How do I install the apks? You need to run the Installer script that applies to you, read above. See how to run a shell script on [windows](https://www.thewindowsclub.com/how-to-run-sh-or-shell-script-file-in-windows-10), [macOS/Linux](https://askubuntu.com/a/38670)
- Do I have an arm, a64 or arm64 device? Check using [Treble Info](https://play.google.com/store/apps/details?id=tk.hack5.treblecheck)
