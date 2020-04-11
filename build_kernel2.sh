#!/bin/bash
export CROSS_COMPILE=/home/stic/桌面/msm8974/arm-eabi-4.9.4/bin/arm-eabi-
export ARCH=arm
export SUBARCH=arm
export KBUILD_BUILD_HOST="Xiaomi MIX 2S"
export KBUILD_BUILD_USER=root
mkdir out
make O=out clean
make O=out mrproper
make O=out stic-cancro_defconfig
make CONFIG_NO_ERROR_ON_MISMATCH=y O=out -j16