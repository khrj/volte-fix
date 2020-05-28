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

if [ "$1" != "32" ] && [ "$1" != "64" ]
then
	echo "Usage: ./install-local.sh (32|64)"
	exit 1
fi

scriptdir=$(cd ./"$(dirname "$0")"/ || exit; pwd)
su <<EOF
remount; mount -o remount,rw /; mount -o remount,rw /system
mv "$scriptdir"/binder${1}/ims /system/priv-app/
setprop persist.dbg.allow_ims_off 1
setprop persist.dbg.volte_avail_ovr 1
setprop persist.dbg.vt_avail_ovr 1
setprop persist.dbg.wfc_avail_ovr 1
setprop persist.sys.phh.ims.caf true
EOF
read -p "A reboot is required to enable VoLTE. Would you like to reboot now? (y/n)?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	am broadcast android.intent.action.ACTION_SHUTDOWN
  sleep 5
  reboot
fi
