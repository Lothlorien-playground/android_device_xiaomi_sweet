#
# AxionAOSP-specific Flags
#
# Maintainer name (use "_" for spaces, e.g., "rmp_22" → "rmp 22" in UI)
AXION_MAINTAINER := galadriel

# Processor name (use "_" for spaces)
AXION_PROCESSOR := Snapdragon_732G_(8_nm)

# Define front camera specs
AXION_CAMERA_FRONT_INFO := 16

# BCR
TARGET_PREBUILT_BCR := true

# Blur
TARGET_ENABLE_BLUR := true

# Bootanimation
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2400

# Bypass Charging
BYPASS_CHARGE_SUPPORTED := true

# EPPE (Enhanced Power Policy Engine)
TARGET_DISABLE_EPPE := true

# Flash Strength
TORCH_STR_SUPPORTED := true

# GPU
GPU_FREQS_PATH := /sys/class/kgsl/kgsl-3d0/devfreq/available_frequencies
GPU_MIN_FREQ_PATH := /sys/class/kgsl/kgsl-3d0/devfreq/min_freq

# Lineage Prebuilts
ifneq ($(WITH_GMS),true)
PRODUCT_PACKAGES += \
    Jelly \
    Glimpse
endif

# Enable or disable ScrollOptimizer globally
persist.sys.perf.scroll_opt = true

# Heavy app handling mode
# 0 - Disable heavy app classification
# 1 - Enable dynamic detection (based on frame duration and buffer load)
# 2 - Treat all apps as heavy for performance
persist.sys.perf.scroll_opt.heavy_app = 2
