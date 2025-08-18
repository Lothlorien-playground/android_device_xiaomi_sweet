#
# SPDX-FileCopyrightText: The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6150-common
$(call inherit-product, device/xiaomi/sm6150-common/common.mk)

# API level, the device has been commercially launched on
PRODUCT_SHIPPING_API_LEVEL := 30

# Audio
PRODUCT_PACKAGES += \
    sku_sweet_audio_symlink

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio,$(TARGET_COPY_OUT_VENDOR)/etc)

# Display
PRODUCT_PACKAGES += \
    hwcomposer.sweet

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/qdcm,$(TARGET_COPY_OUT_VENDOR)/etc)

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir-service.lineage

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    Tag

PRODUCT_PACKAGES += \
    android.hardware.nfc-service.nxp

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_sweet/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_sweet/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_sweet/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_sweet/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_sweet/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_sweet/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_sweet/com.nxp.mifare.xml

# OMX Service
TARGET_SUPPORTS_OMX_SERVICE := false

# Overlay
PRODUCT_PACKAGES += \
    ApertureOverlaySweet \
    FrameworkResOverlaySweet \
    SettingsOverlaySweet \
    SystemUIOverlaySweet

PRODUCT_PACKAGES += \
    SettingsProviderM2101K6G \
    SettingsProviderM2101K6I \
    WifiOverlayM2101K6G \
    WifiOverlayM2101K6I

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Properties
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/properties/build_GLOBAL.prop:$(TARGET_COPY_OUT_ODM)/etc/build_GLOBAL.prop \
    $(LOCAL_PATH)/configs/properties/build_INDIA-pro.prop:$(TARGET_COPY_OUT_ODM)/etc/build_INDIA-pro.prop \
    $(LOCAL_PATH)/configs/properties/build_INDIA-std.prop:$(TARGET_COPY_OUT_ODM)/etc/build_INDIA-std.prop \
    $(LOCAL_PATH)/configs/properties/build_JAPAN.prop:$(TARGET_COPY_OUT_ODM)/etc/build_JAPAN.prop

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/properties/build_GLOBAL.prop:$(TARGET_COPY_OUT_RECOVERY)/root/build_GLOBAL.prop \
    $(LOCAL_PATH)/configs/properties/build_INDIA-pro.prop:$(TARGET_COPY_OUT_RECOVERY)/root/build_INDIA-pro.prop \
    $(LOCAL_PATH)/configs/properties/build_INDIA-std.prop:$(TARGET_COPY_OUT_RECOVERY)/root/build_INDIA-std.prop \
    $(LOCAL_PATH)/configs/properties/build_JAPAN.prop:$(TARGET_COPY_OUT_RECOVERY)/root/build_JAPAN.prop

# Rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.sweet.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.sweet.rc

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/sweet/sweet-vendor.mk)
