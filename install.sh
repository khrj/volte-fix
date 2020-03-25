set -e

scriptdir=$(cd ./$(dirname $0)/; pwd)

adb root
adb remount
adb push $scriptdir/ims /system/priv-app/
adb push $scriptdir/android.hardware.telephony.ims.xml /system/etc/permissions

echo REBOOT YOUR PHONE 4 TO 5 TIMES TO ACTIVATE VoLTE
