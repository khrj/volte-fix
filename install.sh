set -e

if [ “$1” != “32” ] && [ “$1” != “64” ]
then
	echo "Usage: ./install.sh (32|64)"
	exit 1
fi

scriptdir=$(cd ./$(dirname $0)/; pwd)
adb root
adb remount
adb push $scriptdir/binder${1}/ims /system/priv-app/
adb push $scriptdir/android.hardware.telephony.ims.xml /system/etc/permissions
adb shell setprop persist.dbg.allow_ims_off 1
adb shell setprop persist.dbg.volte_avail_ovr 1
adb shell setprop persist.dbg.vt_avail_ovr 1
adb shell setprop persist.dbg.wfc_avail_ovr 1
adb shell setprop persist.sys.phh.ims.caf true

read -p "A reboot is required to enable VoLTE. Would you like to reboot now? (y/n)?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	adb reboot &
fi
