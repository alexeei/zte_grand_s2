# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

TARGET_SPECIFIC_HEADER_PATH := device/zte/msm8974-common/include

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

# QCOM
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY := true

TARGET_QCOM_DISPLAY_VARIANT := caf-new
TARGET_DISPLAY_USE_RETIRE_FENCE := true

HAVE_ADRENO_SOURCE := false
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Thermal
#BOARD_USES_EXTRA_THERMAL_SENSOR := true

# Preload Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true

# PowerHAL
TARGET_USES_CM_POWERHAL := true
#TARGET_PROVIDES_POWERHAL := true

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.qcom

# NFC
#BOARD_HAVE_NFC := true

# Webkit
TARGET_FORCE_CPU_UPLOAD := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true

BOARD_HAL_STATIC_LIBRARIES := libdumpstate.msm8974

#BOARD_HARDWARE_CLASS := device/zte/msm8974-common/cmhw/

TARGET_RELEASETOOLS_EXTENSIONS := device/zte/msm8974-common

BOARD_USES_QC_TIME_SERVICES := true

BOARD_SEPOLICY_DIRS += \
	device/zte/msm8974-common/sepolicy

# The list below is order dependent
BOARD_SEPOLICY_UNION += \
	file_contexts \
	app.te \
	device.te

