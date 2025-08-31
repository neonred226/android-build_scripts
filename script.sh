#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/neonred226/manifest -b 15 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/neonred226/android-rom-build -b PixelP .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=TeamAspectPower
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

# initiate build setup
. build/envsetup.sh



echo "======= Export Done ======"
lunch aosp_topaz-bp1a-userdebug && make bacon
