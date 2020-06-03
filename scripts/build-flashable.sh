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

cd $scriptdir/.. || exit

cp -rf ./FlashableZip/ ./zip-temp/
mkdir -p ./zip-temp/system/priv-app/

# 64 bit binder
cp -rf ./binder64/ims ./zip-temp/system/priv-app/
(cd ./zip-temp && zip -0ry ../GSI-Qualcomm-VoLTE-Fix-binder-64.zip . -x "*.DS_Store")

rm -rf ./zip-temp/system/priv-app/ims/

# 32 bit binder
cp -rf ./binder32/ims ./zip-temp/system/priv-app/
(cd ./zip-temp && zip -0ry ../GSI-Qualcomm-VoLTE-Fix-binder-32.zip . -x "*.DS_Store")

rm -rf ./zip-temp/
