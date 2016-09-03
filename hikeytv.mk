# Inherit the full_base and device configurations
$(call inherit-product, device/linaro/hikey/hikey.mk)
$(call inherit-product, device/google/atv/products/atv_base.mk)

PRODUCT_PACKAGES += \
    AtvRemoteService \
    LeanbackLauncher \
    DVBTuner \
    libdvb_jni \
    libdvbv5



#
# Overrides
PRODUCT_BRAND := Android
PRODUCT_NAME := hikeytv
PRODUCT_DEVICE := hikey
