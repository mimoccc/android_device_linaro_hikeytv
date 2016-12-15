#!/bin/bash

cd $ANDROID_BUILD_TOP/packages/apps/TV
mm -j16 && \
adb push $OUT/system/lib/libtunertvinput_jni.so /system/lib/libtunertvinput_jni.so && \
adb push $OUT/system/lib64/libtunertvinput_jni.so /system/lib64/libtunertvinput_jni.so && \
adb push $OUT/system/priv-app/LiveTv /system/priv-app && \
adb shell am force-stop com.android.tv
