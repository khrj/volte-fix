LD_LIBRARY_PATH=./signapk/ java -jar ./signapk/signapk.jar -a 4096\
  ./signapk/platform.x509.pem \
  ./signapk/platform.pk8 \
  binder64/ims/ims/dist/ims.apk binder64/ims/ims.apk

LD_LIBRARY_PATH=./signapk/ java -jar ./signapk/signapk.jar -a 4096\
  ./signapk/platform.x509.pem \
  ./signapk/platform.pk8 \
  binder32/ims/ims/dist/ims.apk binder32/ims/ims.apk

