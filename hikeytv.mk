
# Inherit the atv_base and device configurations
TARGET_PREBUILT_KERNEL := device/linaro/hikey-kernel/Image-dtb
TARGET_PREBUILT_DTB := device/linaro/hikey-kernel/hi6220-hikey.dtb
TARGET_FSTAB := fstab.hikey


PRODUCT_COPY_FILES +=  \
	device/linaro/hikeytv/etc/media_codecs.xml:system/etc/media_codecs.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_tv.xml:system/etc/media_codecs_google_tv.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \


$(call inherit-product, device/linaro/hikey/hikey/device-hikey.mk)
$(call inherit-product, device/linaro/hikey/device-common.mk)



#undefine PRODUCT_IS_ATV_SDK
USE_OEM_TV_APP := true

# Dirty Hack to include the AOSP LiveTV package by default
#PRODUCT_IS_ATV_SDK := true
$(call inherit-product, device/google/atv/products/atv_base.mk)


PRODUCT_PACKAGES += LiveTv
PRODUCT_COPY_FILES += \
	device/google/atv/permissions/com.google.android.tv.installed.xml:system/etc/permissions/com.google.android.tv.installed.xml

	

PRODUCT_COPY_FILES +=  \
        device/linaro/hikeytv/etc/rc_keymaps/rc-pinnacle-pctv-hd:system/etc/rc_keymaps/rc-pinnacle-pctv-hd \
        device/linaro/hikeytv/etc/init/keytable.rc:system/etc/init/keytable.rc \

PRODUCT_CHARACTERISTICS := nosdcard,tv

# LeanbackLauncher from fugu proproprietary binaries
PRODUCT_PACKAGES += \
	LeanbackLauncher

# ir-keytable to handle rc_keymaps
PRODUCT_PACKAGES += \
    ir-keytable

# RemoteControl Service to handle IR-STB Remotes
PRODUCT_PACKAGES += \
    RemoteControl
    
   
# Default adb/tcp enabled by default
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    service.adb.tcp.port = 5555
    
# Override the lcd density to Nexus Player 320
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density = 320
    
# Some extra TV Application properties
# to make debugging and testing easier
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.tv.tuner.show_debug = true \
    tv_allow_strict_mode = false


#DEVICE_PACKAGE_OVERLAYS := device/linaro/hikeytv/overlay

#
# Overrides
PRODUCT_BRAND := Android
PRODUCT_NAME := hikeytv
PRODUCT_DEVICE := hikeytv
