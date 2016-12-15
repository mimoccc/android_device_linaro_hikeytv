include device/linaro/hikey/hikey/BoardConfig.mk

BOARD_KERNEL_CMDLINE := console=ttyFIQ0 androidboot.console=ttyFIQ0 androidboot.hardware=hikey firmware_class.path=/system/etc/firmware efi=noruntime androidboot.selinux=permissive

#TARGET_NO_RECOVERY := false
#TARGET_RECOVERY_FSTAB := device/linaro/hikey/fstab.hikey

# Default adb/tcp enabled by default
ADDITIONAL_DEFAULT_PROPERTIES += \
    service.adb.tcp.port = 5555
