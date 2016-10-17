su 0 setenforce 0
su 0 stop adbd
su 0 setprop service.adb.tcp.port 5555
su 0 start adbd
ip addr
