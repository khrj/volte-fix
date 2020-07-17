#!/bin/bash
# Copyright 2020 Khushraj Rathod
#
# This file is part of VoLTE-Fix.
#
# VoLTE-Fix is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# VoLTE-Fix is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with VoLTE-Fix.  If not, see <https://www.gnu.org/licenses/>.

set -e

scriptdir=$(cd ./"$(dirname "$0")"/ || exit; pwd)
adb root
adb remount

if adb shell getprop ro.product.cpu.abi | grep -q 'arm64-v8a'; then
    adb push "$scriptdir"/64bit/ims /system/priv-app/
elif adb shell getprop ro.product.cpu.abi | grep -q 'armeabi-v7a'; then
    adb push "$scriptdir"/32bit/ims /system/priv-app/
else
    echo "Unknown architecture"
    exit 1
fi

adb push "$scriptdir"/xmls/* /system/etc/permissions/

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
