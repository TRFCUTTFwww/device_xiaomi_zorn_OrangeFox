#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/zorn

# Inherit from device.mk configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Release name
PRODUCT_RELEASE_NAME := zorn

## Device identifier
PRODUCT_DEVICE := zorn
PRODUCT_NAME := twrp_zorn
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi K80
PRODUCT_MANUFACTURER := Xiaomi

# Haptic
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FQNAME := "IVibrator/vibratorfeature"
TW_SUPPORT_INPUT_AIDL_HAPTICS_FIX_OFF := true

# Reset allocatable space
PRODUCT_PROPERTY_OVERRIDES += ro.dynamic.full_size=8321499136

# SPR
PRODUCT_PROPERTY_OVERRIDES += vendor.display.enable_spr=1

# Touch
TW_XIAOMI_TOUCH_PERMISSION_FIX := true

# Theme
TW_STATUS_ICONS_ALIGN := center
TW_Y_OFFSET := 99
TW_H_OFFSET := -99
