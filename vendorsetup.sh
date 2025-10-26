#!/bin/bash

step() {
  echo -e "\n==> $1"
}

step "Patching device/lineage/sepolicy..."
(
  cd device/lineage/sepolicy || exit 1
  git fetch https://github.com/Anything-at-source-side/android_device_lineage_sepolicy.git sixteen
  git cherry-pick 83845eba5cf6f55b0c0dd34de8737fc6373d39ce
)

step "Patching frameworks/av..."
(
  cd frameworks/av || exit 1
  git fetch https://github.com/Anything-at-source-side/android_frameworks_av.git sixteen
  git cherry-pick 935b711^..8ee692a
)

step "Patching frameworks/base..."
(
  cd frameworks/base || exit 1
  git fetch https://github.com/Anything-at-source-side/android_frameworks_base.git sixteen
  git cherry-pick 6f46b2a^..9d1741d
)

step "Patching frameworks/native..."
(
  cd frameworks/native || exit 1
  git fetch https://github.com/Anything-at-source-side/android_frameworks_native.git sixteen
  git cherry-pick d50911a^..0e603b3
)

step "Patching hardware/lineage/compat..."
(
  cd hardware/lineage/compat || exit 1
  git fetch https://github.com/Anything-at-source-side/android_hardware_lineage_compat.git sixteen
  git cherry-pick a6f0a84^..393edd8
)

step "Patching hardware/lineage/interfaces..."
(
  cd hardware/lineage/interfaces || exit 1
  git fetch https://github.com/Anything-at-source-side/android_hardware_lineage_interfaces.git sixteen
  git cherry-pick 8b19684^..9b252b1
)

step "Cloning packages/apps/DisplayFeatures..."
(
  if [ ! -d "packages/apps/DisplayFeatures/.git" ]; then
    git clone https://github.com/Anything-at-source-side/android_packages_apps_DisplayFeatures.git packages/apps/DisplayFeatures
  else
    echo "packages/apps/DisplayFeatures already exists, skipping clone."
  fi
)

step "Patching packages/apps/Settings..."
(
  cd packages/apps/Settings || exit 1
  git fetch https://github.com/Anything-at-source-side/android_packages_apps_Settings.git sixteen
  git cherry-pick 68fcc7b^..11e745a
)

step "Patching system/core..."
(
  cd system/core || exit 1
  git fetch https://github.com/Anything-at-source-side/android_system_core.git sixteen
  git cherry-pick 229c89f7e7e6ec2fee3c121ac9d8fc416a830390
)

step "Patching vendor/yaap..."
(
  cd vendor/yaap || exit 1
  git fetch https://github.com/Anything-at-source-side/android_vendor_yaap.git sixteen
  git cherry-pick 54fd8f2^..86e6063
)

step "Cloning Rissu KernelSU..."
(
  if [ ! -d "kernel/xiaomi/sm6150/drivers/kernelsu" ]; then
    git clone https://github.com/rsuntk/KernelSU.git -b main kernel/xiaomi/sm6150/drivers/kernelsu
  else
    echo "KernelSU already exists, skipping clone."
  fi
)

echo -e "\nAll steps completed successfully!"
