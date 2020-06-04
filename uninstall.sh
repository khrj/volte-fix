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

rm -rf /system/priv-app/ims/

adb shell setprop persist.dbg.allow_ims_off 0
adb shell setprop persist.dbg.volte_avail_ovr 0
adb shell setprop persist.dbg.vt_avail_ovr 0
adb shell setprop persist.dbg.wfc_avail_ovr 0
adb shell setprop persist.sys.phh.ims.caf false

read -p "A reboot is required to complete uninstallation. Would you like to reboot now? (y/n)?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	adb reboot &
fi
