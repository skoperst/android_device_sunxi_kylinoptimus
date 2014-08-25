# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

include device/softwinner/kylin-common/BoardConfigCommon.mk


# image related
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false

TARGET_KERNEL_SOURCE := kernel/allwinner/optimus
TARGET_KERNEL_CONFIG := sun9iw1p1smp_android_defconfig
#INSTALLED_KERNEL_TARGET := kernel
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_CMDLINE := 
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 

# recovery stuff
#TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_kylin_optimus
SW_BOARD_TOUCH_RECOVERY :=true
#TARGET_RECOVERY_UPDATER_LIBS :=

# wifi and bt configuration

# 1. Wifi Configuration
#BOARD_WIFI_VENDOR := realtek
BOARD_WIFI_VENDOR := broadcom

# 1.1 broadcom wifi support
ifeq ($(BOARD_WIFI_VENDOR), broadcom)
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    WPA_SUPPLICANT_VERSION      := VER_0_8_X
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
    BOARD_HOSTAPD_DRIVER        := NL80211
    BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
    BOARD_WLAN_DEVICE           := bcmdhd
    WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"

    SW_BOARD_USR_WIFI := AP6330
    include hardware/broadcom/wlan/bcmdhd/firmware/firmware-bcm.mk
endif


# 2. Bluetooth Configuration
# make sure BOARD_HAVE_BLUETOOTH is true for every bt vendor
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
#BOARD_HAVE_BLUETOOTH_RTK := true
#BLUETOOTH_HCI_USE_RTK_H5 := true
SW_BOARD_HAVE_BLUETOOTH_NAME := ap6330
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/softwinner/kylin-optimus/bluetooth/

# boostup code will on command to set CPU roomage and DDR freq
# default enable
#TARGET_USE_BOOSTUP_OPZ := true

