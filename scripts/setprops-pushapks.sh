remount; mount -o remount,rw /; mount -o remount,rw /system
mv "$1"/binder${2}/ims /system/priv-app/
setprop persist.dbg.allow_ims_off 1
setprop persist.dbg.volte_avail_ovr 1
setprop persist.dbg.vt_avail_ovr 1
setprop persist.dbg.wfc_avail_ovr 1
setprop persist.sys.phh.ims.caf true
