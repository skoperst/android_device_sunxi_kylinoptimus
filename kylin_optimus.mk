$(call inherit-product, device/softwinner/kylin-common/kylin-common.mk)

DEVICE_PACKAGE_OVERLAYS := \
    device/softwinner/kylin-optimus/overlay \
    $(DEVICE_PACKAGE_OVERLAYS)

# Abandon useless system app. Add which module name in apk/Android.mk kylin_n71j_app section.
PRODUCT_PACKAGES += \
    kylin_optimus_app

# google pinyin
PRODUCT_PACKAGES += GooglePinyin

# gps
BOARD_USES_GPS_TYPE := simulator
PRODUCT_PACKAGES += \
    gps.kylin \
    bt_vendor.conf

PRODUCT_COPY_FILES += \
	device/softwinner/kylin-common/gps.conf:system/etc/gps.conf

# for recovery
PRODUCT_COPY_FILES += \
    device/softwinner/kylin-optimus/recovery.fstab:recovery.fstab \
    device/softwinner/kylin-optimus/modules/modules/sw-device.ko:obj/sw-device.ko
#    device/softwinner/kylin-optimus/modules/modules/disp.ko:obj/disp.ko \
#    device/softwinner/kylin-optimus/modules/modules/lcd.ko:obj/lcd.ko \
#    device/softwinner/kylin-optimus/modules/modules/hdcp.ko:obj/hdcp.ko \
#    device/softwinner/kylin-optimus/modules/modules/gt82x.ko:obj/gt82x.ko \
    

PRODUCT_COPY_FILES += \
    device/softwinner/kylin-optimus/fstab.sun9i:root/fstab.sun9i \
    device/softwinner/kylin-optimus/init.sun9i.rc:root/init.sun9i.rc \
    device/softwinner/kylin-optimus/init.recovery.sun9i.rc:root/init.recovery.sun9i.rc \
    device/softwinner/kylin-optimus/ueventd.sun9i.rc:root/ueventd.sun9i.rc 
#    device/softwinner/kylin-optimus/modules/modules/nand.ko:root/nand.ko \
#    device/softwinner/kylin-optimus/modules/modules/lcd.ko:root/lcd.ko \
#    device/softwinner/kylin-optimus/modules/modules/disp.ko:root/disp.ko \
#    device/softwinner/kylin-optimus/modules/modules/hdcp.ko:root/hdcp.ko 
#    device/softwinner/kylin-optimus/kernel:kernel \
PRODUCT_COPY_FILES += \
    device/softwinner/kylin-optimus/configs/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

PRODUCT_COPY_FILES += \
    device/softwinner/kylin-optimus/configs/camera.cfg:system/etc/camera.cfg \
    device/softwinner/kylin-optimus/configs/cfg-Gallery2.xml:system/etc/cfg-Gallery2.xml \
    device/softwinner/kylin-optimus/configs/gsensor.cfg:system/usr/gsensor.cfg \
    device/softwinner/kylin-optimus/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/softwinner/kylin-optimus/configs/sunxi-keyboard.kl:system/usr/keylayout/sunxi-keyboard.kl \
    device/softwinner/kylin-optimus/configs/sunxi-ir.kl:system/usr/keylayout/sunxi-ir.kl \
    device/softwinner/kylin-optimus/configs/tp.idc:system/usr/idc/tp.idc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml   \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_COPY_FILES += \
    device/softwinner/kylin-optimus/initlogo.rle:root/initlogo.rle \
    device/softwinner/kylin-optimus/media/bootanimation.zip:system/media/bootanimation.zip \
    device/softwinner/kylin-optimus/media/boot.wav:system/media/boot.wav \
    device/softwinner/kylin-optimus/media/bootlogo.bmp:system/media/bootlogo.bmp \
    device/softwinner/kylin-optimus/media/initlogo.bmp:system/media/initlogo.bmp 

# wifi & bt config file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

 # camera config for isp
PRODUCT_COPY_FILES += \
    device/softwinner/kylin-common/hawkview/16M/ov16825/isp_3a_param.ini:system/etc/hawkview/ov16825/isp_3a_param.ini \
    device/softwinner/kylin-common/hawkview/16M/ov16825/isp_iso_param.ini:system/etc/hawkview/ov16825/isp_iso_param.ini \
    device/softwinner/kylin-common/hawkview/16M/ov16825/isp_test_param.ini:system/etc/hawkview/ov16825/isp_test_param.ini \
    device/softwinner/kylin-common/hawkview/16M/ov16825/isp_tuning_param.ini:system/etc/hawkview/ov16825/isp_tuning_param.ini \
    device/softwinner/kylin-common/hawkview/16M/ov16825/bin/gamma_tbl.bin:system/etc/hawkview/ov16825/bin/gamma_tbl.bin \
    device/softwinner/kylin-common/hawkview/16M/ov16825/bin/hdr_tbl.bin:system/etc/hawkview/ov16825/bin/hdr_tbl.bin \
    device/softwinner/kylin-common/hawkview/16M/ov16825/bin/lsc_tbl.bin:system/etc/hawkview/ov16825/bin/lsc_tbl.bin

# Telephony
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)

# Radio Packages and Configuration Flie
$(call inherit-product, device/softwinner/kylin-common/rild/kylin_radio.mk)
#$(call inherit-product, device/softwinner/kylin-optimus/ril_modem/huawei/mu509/huawei_mu509.mk)
#$(call inherit-product, device/softwinner/kylin-optimus/ril_modem/Oviphone/em55/oviphone_em55.mk)
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sf.showhdmisettings=7 \
	persist.sys.hdmimode=10\
	persist.sys.layer0usefe=1
# Radio parameter
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libargs=-d/dev/ttyUSB2 \
    rild.libpath=libsoftwinner-ril-4.4.so

# When set ro.sys.adaptive_memory=1, firmware can adaptive different dram size.
# And dalvik vm parameters configuration will become invalid.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.adaptive_memory=0

# dalvik vm parameters
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=384m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m \
    ro.zygote.disable_gl_preload=true

# drm
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=false

# usb
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.udisk.lable=kylin \
    ro.adb.secure=0

# ui
PRODUCT_PROPERTY_OVERRIDES += \
    ro.property.tabletUI=false \
    persist.sf.lcd_density=213 \
    ro.property.fontScale=1.0 \
    ro.sf.hwrotation=0 \
    ro.property.max_video_height=2160 

#for evb hdmi density setting
PRODUCT_PROPERTY_OVERRIDES += \
    persist.evb_flag=1

PRODUCT_PROPERTY_OVERRIDES += \
	ro.hwui.texture_cache_size=170 \
	ro.hwui.layer_cache_size=135 \
	ro.hwui.path_cache_size=34 \
	ro.hwui.shap_cache_size=9 \
	ro.hwui.drop_shadow_cache_size=17 \
	ro.hwui.r_buffer_cache_size=17

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.firmware=v1.2

# function
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.bootfast=true \
    ro.product.support_smartscreen=false

# default language setting
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Asia/Shanghai \
    persist.sys.country=CN \
    persist.sys.language=zh

# update
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.update.server=http://115.29.165.148/ota/service/request

$(call inherit-product-if-exists, device/softwinner/kylin-optimus/modules/modules.mk)

# Overrides
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_BRAND := Allwinner
PRODUCT_NAME := kylin_optimus
PRODUCT_DEVICE := kylin-optimus
PRODUCT_MODEL := UltraOcta A80 OptimusBoard
PRODUCT_MANUFACTURER := Allwinner

include device/softwinner/kylin-common/prebuild/google/products/gms_base.mk
