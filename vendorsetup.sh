#
# Copyright (C) 2013 The Android Open Source Project
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

# This file is executed by build/envsetup.sh, and can use anything
# defined in envsetup.sh.
#
# In particular, you can add lunch options with the add_lunch_combo
# function: add_lunch_combo generic-eng

add_lunch_combo hikeytv-userdebug
add_lunch_combo hikeytv-eng

export ANDROID_KERNEL_SRC_PATH=/build/hikey-linaro
export ANDROID_KERNEL_CROSS_COMPILE=aarch64-linux-androidkernel-
export ANDROID_KERNEL_PREBUILT_PATH=$(gettop)/device/linaro/hikey-kernel
export PATH=$PATH:$(gettop)/device/linaro/hikeytv/utils
function kernelconfig() {
    CROSS_COMPILE=$ANDROID_KERNEL_CROSS_COMPILE ARCH=$( get_build_var TARGET_ARCH )  make --directory=$ANDROID_KERNEL_SRC_PATH menuconfig
}
function kerneldefconfig() {
    CROSS_COMPILE=$ANDROID_KERNEL_CROSS_COMPILE ARCH=$( get_build_var TARGET_ARCH )  make --directory=$ANDROID_KERNEL_SRC_PATH hikey_defconfig
}
function kernelbuild() {
    CROSS_COMPILE=$ANDROID_KERNEL_CROSS_COMPILE ARCH=$( get_build_var TARGET_ARCH )  make --directory=$ANDROID_KERNEL_SRC_PATH -j16
}
function kernelcopy() {
    cp -v $ANDROID_KERNEL_SRC_PATH/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb  $ANDROID_KERNEL_PREBUILT_PATH/hi6220-hikey.dtb
    cp -v $ANDROID_KERNEL_SRC_PATH/arch/arm64/boot/Image-dtb $ANDROID_KERNEL_PREBUILT_PATH/Image-dtb

}
function kernelcopyout {
    kernelcopy
    cp -v $ANDROID_KERNEL_PREBUILT_PATH/Image-dtb $ANDROID_PRODUCT_OUT/kernel
    cp -v $ANDROID_KERNEL_PREBUILT_PATH/hi6220-hikey.dtb $ANDROID_PRODUCT_OUT/hi6220-hikey.dtb

}
function kernelsync() {
    cd $ANDROID_KERNEL_SRC_PATH
    GIT_DIR=$ANDROID_KERNEL_SRC_PATH/.git git pull --verbose --all
    cd -
}
function kernelreset() {
    cd $ANDROID_KERNEL_SRC_PATH
    GIT_DIR=$ANDROID_KERNEL_SRC_PATH/.git git reset --hard
    cd -
}

function flashbootnodeps() {
	source $(gettop)/device/linaro/hikeytv/utils/flashbootnodeps.sh
}
function flashlivetv() {
	source $(gettop)/device/linaro/hikeytv/utils/mklivetv.sh
}
