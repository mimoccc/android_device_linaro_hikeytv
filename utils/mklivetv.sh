#!/bin/bash
adb remount
croot
make -j16 LiveTv && \
adb push $OUT/system/lib64/libtunertvinput_jni.so /system/lib64/libtunertvinput_jni.so && \
adb push $OUT/system/priv-app/LiveTv /system/priv-app && \
adb shell am force-stop com.android.tv
adb shell "sqlite3  /data/user/0/com.android.providers.tv/databases/tv.db 'delete from channels;'"
#adb shell rm -rf /data/data/com.android.tv
adb shell setprop tv_allow_strict_mode false
adb shell am start com.android.tv/com.android.tv.tuner.setup.TunerSetupActivity
adb shell input keyevent KEYCODE_ENTER
adb shell input keyevent KEYCODE_DPAD_DOWN
adb shell input keyevent KEYCODE_DPAD_DOWN
adb shell input keyevent KEYCODE_ENTER
