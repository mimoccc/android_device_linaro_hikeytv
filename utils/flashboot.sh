#!/bin/bash

make -j16 bootimage
adb push $OUT/boot.img /data/
adb shell "cat /data/boot.img > /dev/block/platform/soc/f723d000.dwmmc0/by-name/boot"
adb reboot