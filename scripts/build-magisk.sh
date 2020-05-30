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

scriptdir=$(cd ./"$(dirname "$0")"/ || exit; pwd)

cp -rf $scriptdir/../Magisk/ $scriptdir/../Magisk-temp/
mkdir -p $scriptdir/../Magisk-temp/system/priv-app/
wget -O $scriptdir/../Magisk-temp/META-INF/com/google/android/update-binary https://raw.githubusercontent.com/topjohnwu/Magisk/master/scripts/module_installer.sh

# 64 bit binder
cp -rf $scriptdir/../binder64/ims/ $scriptdir/../Magisk-temp/system/priv-app/
zip -0 -r $scriptdir/../GSI-Qualcomm-VoLTE-Fix-binder-64.zip $scriptdir/../Magisk-temp/system/ $scriptdir/../Magisk-temp/META-INF/ $scriptdir/../Magisk-temp/module.prop $scriptdir/../Magisk-temp/system.prop -x "*.DS_Store"

rm -rf $scriptdir/../Magisk-temp/system/priv-app/ims/

# 32 bit binder
cp -rf $scriptdir/../binder32/ims/ $scriptdir/../Magisk-temp/system/priv-app/
zip -0 -r $scriptdir/../GSI-Qualcomm-VoLTE-Fix-binder-32.zip $scriptdir/../Magisk-temp/system/ $scriptdir/../Magisk-temp/META-INF/ $scriptdir/../Magisk-temp/module.prop $scriptdir/../Magisk-temp/system.prop -x "*.DS_Store"

rm -rf $scriptdir/../Magisk-temp/
