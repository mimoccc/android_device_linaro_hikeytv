#!/system/bin/sh
dmesg -c 1>/dev/null
echo 1 > /sys/module/em28xx_rc/parameters/ir_debug
echo 1 > /sys/module/rc_core/parameters/debug
ir-keytable -c -w /data/rc6_mce
ir-keytable -p rc-5 -p rc-6