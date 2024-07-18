$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/j3lte/j3lte-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/j3lte/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/j3lte/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

# Set variables to overwrite the inherited values. Non-template values have been commented out.
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := lineage_j3lte
PRODUCT_DEVICE := j3lte
#PRODUCT_MODEL := SM-J327P
#PRODUCT_BRAND := samsung
#PRODUCT_MANUFACTURER := samsung
#PRODUCT_GMS_CLIENTID_BASE := android-samsung
