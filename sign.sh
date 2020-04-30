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

LD_LIBRARY_PATH=./signapk/ java -jar ./signapk/signapk.jar -a 4096\
  ./signapk/platform.x509.pem \
  ./signapk/platform.pk8 \
  binder64/ims/ims/dist/ims.apk binder64/ims/ims.apk

LD_LIBRARY_PATH=./signapk/ java -jar ./signapk/signapk.jar -a 4096\
  ./signapk/platform.x509.pem \
  ./signapk/platform.pk8 \
  binder32/ims/ims/dist/ims.apk binder32/ims/ims.apk

