#
# Copyright 2013 The Android Open-Source Project
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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/rpi/rpi-kernel/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
TARGET_GLOBAL_CFLAGS += -DBCM_HARDWARE
PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/rpi/rpi/init.bcm2708.rc:root/init.bcm2708.rc \
    device/rpi/rpi/init.recovery.bcm2708.rc:root/init.recovery.bcm2708.rc \
    device/rpi/rpi/fstab.bcm2708:root/fstab.bcm2708 \
    device/rpi/rpi/ueventd.bcm2708.rc:root/ueventd.bcm2708.rc
    
    
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth.xml \

PRODUCT_COPY_FILES += \
	device/rpi/rpi/audio_policy.conf:system/etc/audio_policy.conf \
	device/rpi/rpi/mixer_paths.xml:system/etc/mixer_paths.xml

    
PRODUCT_COPY_FILES += \
	device/rpi/rpi/media_codecs.xml:system/etc/media_codecs.xml \
	device/rpi/rpi/media_profiles.xml:system/etc/media_profiles.xml

$(call inherit-product-if-exists, vendor/rpi/rpi/device-vendor.mk)
$(call inherit-product, device/rpi/rpi/properties.mk)

$(call inherit-product-if-exists, hardware/broardcom/bcm2708/bcm2708.mk)
