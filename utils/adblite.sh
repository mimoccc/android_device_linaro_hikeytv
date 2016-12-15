su 0 stop adbd
su 0 setprop service.adb.tcp.port 5555
su 0 start adbd
su 0 mount -orw,remount /system
