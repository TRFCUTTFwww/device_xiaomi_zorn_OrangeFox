# 继承自设备基础配置
DEVICE_PATH := device/xiaomi/zorn
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# ----------------------------------------------------------------              
# 注入 OrangeFox 灵魂 (核心步骤)
# ----------------------------------------------------------------
# 注意：确保你的 vendor/recovery 目录下有 orangefox.mk
$(call inherit-product, vendor/recovery/orangefox.mk)

## 设备标识符
PRODUCT_DEVICE := zorn
PRODUCT_NAME := fox_zorn  # 这里必须改成 fox_，否则 lunch 认不出来
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi K80
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_RELEASE_NAME := zorn

# OrangeFox 特定配置 (让它变橙色的关键)
FOX_BUILD_TYPE := Unofficial
OF_MAINTAINER := TRFCUTTF

# 屏幕与振动配置 (保留你之前的)
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FQNAME := "IVibrator/vibratorfeature"
TW_SUPPORT_INPUT_AIDL_HAPTICS_FIX_OFF := true
TW_XIAOMI_TOUCH_PERMISSION_FIX := true

# 状态栏偏移
TW_STATUS_ICONS_ALIGN := center
TW_Y_OFFSET := 99
TW_H_OFFSET := -99

# 动态分区支持
PRODUCT_PROPERTY_OVERRIDES += ro.dynamic.full_size=8321499136
