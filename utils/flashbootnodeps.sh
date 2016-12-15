#!/bin/bash
m -j16 ramdisk-nodeps
m -j16 bootimage-nodeps
adb push $OUT/boot.img /data/
adb shell "cat /data/boot.img > /dev/block/platform/soc/f723d000.dwmmc0/by-name/boot"
adb reboot