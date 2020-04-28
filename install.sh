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
echo "REBOOT YOUR PHONE TWICE TO ACTIVATE VoLTE"
