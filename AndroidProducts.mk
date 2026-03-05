#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/fox_zorn.mk
# 将 trunk_staging 改为报错提示中可用的 ap2a
COMMON_LUNCH_CHOICES := \
    fox_zorn-ap2a-eng \
    fox_zorn-ap2a-userdebug
