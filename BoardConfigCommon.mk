#
# Copyright (C) 2017-2023 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

BOARD_VENDOR := motorola

COMMON_PATH := device/motorola/sm8250-common

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    vendor_boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vendor \
    vbmeta \
    vbmeta_system

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a-branchprot
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a76

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    vendor_boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vendor \
    vbmeta \
    vbmeta_system

# Bootloader
TARGET_NO_BOOTLOADER := true

# BUILD_BROKEN_*
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_INCORRECT_PARTITION_IMAGES := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=2048 loop.max_part=7 cgroup.memory=nokmem,nosocket
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CONFIG := \
    vendor/kona-perf_defconfig \
    vendor/ext_config/moto-kona.config
TARGET_KERNEL_SOURCE := kernel/motorola/sm8250
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(COMMON_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := \
    $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD) \
    $(strip $(shell cat $(COMMON_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)
BOARD_RAMDISK_USE_XZ := true

# Kernel modules - WLAN
TARGET_MODULE_ALIASES += \
    wlan.ko:qca_cld3_qca6390.ko

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := kona
TARGET_FWK_SUPPORTS_FULL_VALUEADDS := true

# Audio
AUDIO_FEATURE_ENABLED_DLKM := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
BOARD_SUPPORTS_OPENSOURCE_STHAL := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1


# Display
TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_GRALLOC4 := true
TARGET_USES_HWC2 := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Filesystem
TARGET_FS_CONFIG_GEN := \
    $(COMMON_PATH)/config.fs \
    $(COMMON_PATH)/mot_aids.fs

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
LOC_HIDL_VERSION := 4.0

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    $(COMMON_PATH)/vendor_framework_compatibility_matrix.xml \
    vendor/aosp/config/device_framework_matrix.xml
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(COMMON_PATH):libinit_moto_kona

# Media
TARGET_USES_ION := true

# Partitions
BOARD_USES_RECOVERY_AS_BOOT := true

BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

-include vendor/aosp/config/BoardConfigReservedSize.mk
BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE := 30720000
BOARD_USES_METADATA_PARTITION := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_DTBOIMG_PARTITION_SIZE := 0x1800000
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_MOT_DP_GROUP_PARTITION_LIST := odm product system system_ext vendor
BOARD_MOT_DP_GROUP_SIZE := 6438256640
BOARD_SUPER_PARTITION_GROUPS := mot_dp_group
BOARD_SUPER_PARTITION_SIZE := 12884901888
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 0x04000000
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Power
TARGET_POWERHAL_MODE_EXT := $(COMMON_PATH)/lineagehw/touch/power-mode.cpp
TARGET_USES_INTERACTION_BOOST := true

# Properties
TARGET_ODM_PROP += $(COMMON_PATH)/odm.prop
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# Recovery
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# SELinux
include device/qcom/sepolicy_vndr/SEPolicy.mk
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
PRODUCT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private
PRODUCT_PUBLIC_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/public

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit from the proprietary version
-include vendor/motorola/sm8250-common/BoardConfigVendor.mk
