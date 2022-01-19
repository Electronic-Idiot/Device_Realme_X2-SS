#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/realme/X2/device.mk)

# Inherit some common Octavi stuff.
$(call inherit-product, vendor/octavi/config/common_full_phone.mk)

OCTAVI_BUILD_TYPE=OFFICIAL
OCTAVI_DEVICE_MAINTAINER=CHAITANYA

TARGET_GAPPS_ARCH := arm64
WITH_GAPPS := true

TARGET_BOOT_ANIMATION_RES := 1080

# OctaviOS stuff
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_USES_BLUR := false
EXTRA_UDFPS_ANIMATIONS := true



# Device identifier. This must come after all inclusions.
PRODUCT_NAME := octavi_X2
PRODUCT_DEVICE := X2
PRODUCT_BRAND := realme
PRODUCT_MODEL := realme X2
PRODUCT_MANUFACTURER := realme

BUILD_FINGERPRINT := "google/redfin/redfin:12/SQ1A.220105.002/7961164:user/release-keys"
PRIVATE_BUILD_DESC="redfin-user 12 SQ1A.220105.002 7961164 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-oppo
