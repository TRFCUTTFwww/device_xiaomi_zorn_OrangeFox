#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Rules
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_NINJA_USES_ENV_VARS += RTIC_MPGEN
BUILD_BROKEN_PLUGIN_VALIDATION := soong-libaosprecovery_defaults soong-libguitwrp_defaults soong-libminuitwrp_defaults soong-vold_defaults soong-libinit_zorn_defaults

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := $(TARGET_ARCH_VARIANT)
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := $(TARGET_CPU_VARIANT)
TARGET_2ND_CPU_VARIANT_RUNTIME := $(TARGET_CPU_VARIANT_RUNTIME)

# Assert
TARGET_OTA_ASSERT_DEVICE := $(PRODUCT_RELEASE_NAME)

# API
BOARD_SHIPPING_API_LEVEL := 35
#PRODUCT_SHIPPING_API_LEVEL := 31
#PRODUCT_TARGET_VNDK_VERSION := 33

# Power
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
PRODUCT_PLATFORM := pineapple
TARGET_BOOTLOADER_BOARD_NAME := $(PRODUCT_PLATFORM)
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := xiaomi_sm8650
TARGET_BOARD_PLATFORM_GPU := qcom-adreno750
QCOM_BOARD_PLATFORMS += xiaomi_sm8650

# Kernel
TARGET_KERNEL_ARCH            := arm64
TARGET_KERNEL_HEADER_ARCH     := arm64
BOARD_KERNEL_IMAGE_NAME       := Image
BOARD_BOOT_HEADER_VERSION     := 4
BOARD_KERNEL_PAGESIZE         := 4096
TARGET_KERNEL_CLANG_COMPILE   := true
TARGET_PREBUILT_KERNEL        := $(DEVICE_PATH)/prebuilt/kernel
BOARD_MKBOOTIMG_ARGS          += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS          += --pagesize $(BOARD_KERNEL_PAGESIZE)

# Ramdisk use lz4
BOARD_RAMDISK_USE_LZ4 := true

# A/B
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true

AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    init_boot \
    vendor_boot \
    dtbo \
    vbmeta \
    vbmeta_system \
    odm \
    product \
    system \
    system_ext \
    system_dlkm \
    vendor \
    vendor_dlkm

# Verified Boot
BOARD_AVB_ENABLE := true

# Partitions
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

TARGET_COPY_OUT_ODM := odm
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_VENDOR_DLKMIMAGE := true
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600

# Dynamic Partition
BOARD_SUPER_PARTITION_SIZE := 8321499136
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 8317304832
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor vendor_dlkm odm

# System as root
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
BOARD_SUPPRESS_SECURE_ERASE := true

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Init
TARGET_RECOVERY_DEVICE_MODULES := libinit_zorn
TARGET_PLATFORM_DEVICE_BASE := /devices/soc/
SOONG_CONFIG_NAMESPACES += twrpDeviceVars
SOONG_CONFIG_twrpDeviceVars += TW_RELEASE_DEVICE_NAME
SOONG_CONFIG_twrpDeviceVars_TW_RELEASE_DEVICE_NAME := $(PRODUCT_RELEASE_NAME)

# Extras
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_INCLUDE_OMAPI := true
TW_OMAPI_UUID := 636F6D2E6E78702E7365637572697479
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true
TW_USE_FSCRYPT_POLICY := 2
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Tool
TW_INCLUDE_7ZA := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_ENABLE_ALL_PARTITION_TOOLS := true

# Network
BUILD_BROKEN_USES_NETWORK := true

# F2FS
TW_ENABLE_FS_COMPRESSION := false

# Debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace

# Fastbootd
TW_INCLUDE_FASTBOOTD := true

# TWRP specific build flags
TW_RELEASE_DEVICE_NAME := $(PRODUCT_RELEASE_NAME)
TW_RELEASE_PRODUCT_NAME := $(subst $(space),_,$(PRODUCT_MODEL))

# Other TWRP Configurations
TW_THEME := portrait_hdpi
TW_FRAMERATE := 120
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_NTFS_3G := true
TW_NO_EXFAT_FUSE := true
TW_USE_DMCTL := true
TW_USE_TOOLBOX := true
TARGET_USES_MKE2FS := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_BRIGHTNESS := 250
TW_EXCLUDE_APEX := true
TW_HAS_EDL_MODE := false
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true
TW_LOAD_VENDOR_MODULES := "adsp_loader_dlkm.ko aw882xx_dlkm.ko focaltech_touch.ko nxp-nci.ko stm_st54se_gpio.ko stm_nfc_i2c.ko"
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone25/temp" # CPU-0-0-0
TW_BACKUP_EXCLUSIONS := /data/fonts,/data/adb/ap,/data/adb/ksu
TW_DEVICE_VERSION := $(TW_RELEASE_PRODUCT_NAME)-A15

# --- OrangeFox Specific ---
FOX_BUILD_TYPE := Unofficial
OF_MAINTAINER := Shirasu Azusa
FOX_REPLACE_TOOLBOX := 1
FOX_USE_SED_BINARY := 1
FOX_USE_TAR_BINARY := 1
FOX_USE_ZIP_BINARY := 1
FOX_USE_NANO_EDITOR := 1
FOX_ASH_IS_BASH := 1
# 核心解密增强
FOX_USE_SPECIFIC_GUI_RESOURCES := 1
FOX_ENABLE_APP_MANAGER := 1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
# 开启 Weaver 支持 (核心中的核心)
TW_INCLUDE_WEAVER := true
TW_INCLUDE_CRYPTO_AIDL := true
# 建议补充，确保 AIDL 解密逻辑完整
TW_INCLUDE_CRYPTO_AIDL_EXT := true
# 强制开启 VINTF 校验，防止之前的清单冲突再次导致 Abort
PRODUCT_ENFORCE_VINTF_MANIFEST := true
# 很多 A14 机器需要这个来允许 Recovery 访问 AIDL 服务
TW_RP_AIDL_WEAVER := true
TW_LOAD_VENDOR_MODULES := "adsp_loader_dlkm.ko aw882xx_dlkm.ko focaltech_touch.ko nxp-nci.ko stm_st54se_gpio.ko stm_nfc_i2c.ko"
# 建议在上面这一行尝试加入可能缺失的 I2C/SPI 驱动，因为 Weaver 硬件通常挂在 I2C 上

# 重点：很多 A14 机器解密慢或者失败是因为找不到 Gatekeeper
# 开启这个可以尝试从 System 动态查找解密库
FOX_REPLACE_BUSYBOX_UNTAR := 1
# 告诉脚本这是一个 OrangeFox 编译，强制集成资源
FOX_R11 := 1
FOX_BUILD_DEVICE := zorn

# 针对 A14 的特殊路径修复（如果脚本找不到资源）
TARGET_RECOVERY_GUI_DIR := bootable/recovery/gui
# 重点：告诉橙狐你的 Recovery 到底在哪
OF_DEVICE_RECOVERY_PATHS := /dev/block/by-name/recovery
BOARD_USES_RECOVERY_AS_BOOT := false

# 针对 A/B 设备的补丁
FOX_AB_DEVICE := 1
FOX_VIRTUAL_AB := 1
FOX_VIRTUAL_AB_COMPRESSION := 1

# 自动处理一些 A14 的权限碎事
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# 如果你想让 Recovery 里的字体在大屏幕上看起来更舒服
TW_THEME := portrait_hdpi
# --- End of OrangeFox ---
