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

scriptdir=$(cd ./"$(dirname "$0")"/ || exit; pwd)

cd "$scriptdir"/.. || exit

# First let's make the installer
# Make a copy
cp -rf ./FlashableZip/ ./zip-temp/
# Remove the uninstaller script, we used don't need that now
rm -f ./zip-temp/META-INF/com/google/android/update-binary-uninstall
# Rename the installer script
mv ./zip-temp/META-INF/com/google/android/update-binary-install ./zip-temp/META-INF/com/google/android/update-binary
# Add files to install
mkdir -p ./zip-temp/system64/priv-app/
mkdir -p ./zip-temp/system32/priv-app/
cp -rf ./64bit/ims ./zip-temp/system64/priv-app/
cp -rf ./32bit/ims ./zip-temp/system32/priv-app/
# Make installer zip
(cd ./zip-temp && zip -0ry ../GSI-Qualcomm-VoLTE-Fix.zip . -x "*.DS_Store")
# Cleanup
rm -rf ./zip-temp/

# Now let's make the uninstaller
# Make a copy
cp -rf ./FlashableZip/ ./zip-temp/
# Remove the installer script, we used that earlier
rm -f ./zip-temp/META-INF/com/google/android/update-binary-install
# Rename the uninstaller script
mv ./zip-temp/META-INF/com/google/android/update-binary-uninstall ./zip-temp/META-INF/com/google/android/update-binary
# Make uninstaller zip
(cd ./zip-temp && zip -0ry ../VoLTE-Fix-Uninstaller.zip . -x "*.DS_Store")
# Cleanup
rm -rf ./zip-temp/
