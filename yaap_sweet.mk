#
# SPDX-FileCopyrightText: The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common YetAnotherAOSP Project stuff.
$(call inherit-product, vendor/yaap/config/common_full_phone.mk)

# Inherit from sweet device
$(call inherit-product, device/xiaomi/sweet/device.mk)

PRODUCT_NAME := yaap_sweet
PRODUCT_DEVICE := sweet
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := M2101K6G

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="sweet_global-user 13 RKQ1.210614.002 V14.0.9.0.TKFMIXM release-keys" \
    BuildFingerprint=Redmi/sweet_global/sweet:13/RKQ1.210614.002/V14.0.9.0.TKFMIXM:user/release-keys

# YAAP specific
TARGET_BUILD_GAPPS := true
TARGET_ENABLE_BLUR := true
TARGET_BOARD_PLATFORM := sm6150
