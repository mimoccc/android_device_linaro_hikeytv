# Inherit the atv_base and device configurations
$(call inherit-product, device/linaro/hikey/hikey/device-hikey.mk)
$(call inherit-product, device/linaro/hikey/device-common.mk)
$(call inherit-product, device/google/atv/products/atv_base.mk)

# Copy RC Keymap files
PRODUCT_COPY_FILES +=  \
        device/linaro/hikeytv/sky_plus_rev8:system/etc/rc_keymaps/sky_plus_rev8

# LeanbackLauncher from fugu proproprietary binaries
PRODUCT_PACKAGES += \
    LeanbackLauncher

# ir-keytable to handle rc_keymaps
PRODUCT_PACKAGES += \
    ir-keytable

# RemoteControl Service to handle IR-STB Remotes
PRODUCT_PACKAGES += \
    RemoteControl


#
# Overrides
PRODUCT_BRAND := Android
PRODUCT_NAME := hikeytv
PRODUCT_DEVICE := hikeytv
