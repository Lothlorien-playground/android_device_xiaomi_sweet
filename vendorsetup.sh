#!/bin/bash
set -e  # stop the script if any command fails

step() {
  echo -e "\n==> $1"
}

step "Patching Kernel src for VNL variant..."
(
  cd kernel/xiaomi/sm6150 || exit 1

  patch -p1 < patches/0001-revert-KSU.patch
  patch -p1 < patches/0001-fixed4APatch.patch

  echo "Done, this Kernel is ready for VNL builds..."
)

step "Cloning packages/apps/DisplayFeatures..."
(
  if [ ! -d "packages/apps/DisplayFeatures/.git" ]; then
    git clone https://github.com/Anything-at-source-side/android_packages_apps_DisplayFeatures.git \
      packages/apps/DisplayFeatures
  else
    echo "packages/apps/DisplayFeatures already exists, skipping clone."
  fi
)

echo -e "\nAll steps completed successfully!"
