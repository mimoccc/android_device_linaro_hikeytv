

# Get in there first to avoid being ignored
PRODUCT_COPY_FILES +=  \
        device/linaro/hikeytv/sky_plus_rev8:system/etc/rc_keymaps/sky_plus_rev8 \
        device/linaro/hikey/init.common.rc:root/init.hikey-common.rc \
        device/linaro/hikeytv/init.common.rc:root/init.hikey.rc \


# Inherit the atv_base and device configurations
$(call inherit-product, device/linaro/hikey/hikey/device-hikey.mk)
$(call inherit-product, device/linaro/hikey/device-common.mk)
$(call inherit-product, device/google/atv/products/atv_base.mk)

# LeanbackLauncher from fugu proproprietary binaries
PRODUCT_PACKAGE7S += \
    LeanbackLauncher

# ir-keytable to handle rc_keymaps
PRODUCT_PACKAGES += \
    ir-keytable

# RemoteControl Service to handle IR-STB Remotes
PRODUCT_PACKAGES += \
    RemoteControl
    
PRODUCT_PACKAGES += \
	fastbootd

DEVICE_PACKAGE_OVERLAYS := device/linaro/hikeytv/overlay

#
# Overrides
PRODUCT_BRAND := Android
PRODUCT_NAME := hikeytv
PRODUCT_DEVICE := hikeytv
