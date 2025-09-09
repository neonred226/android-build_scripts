#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/neonred226/android_manifest.git -b 16 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/BaranAspect-Development/android_local_manifests .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=NEONXD
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

# initiate build setup
. build/envsetup.sh


echo "======= Export Done ======"
lunch lineage_topaz-bp2a-userdebug && mka derp
