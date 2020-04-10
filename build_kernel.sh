#!/bin/bash
clear
export CROSS_COMPILE=/mix2s/work/ubertc_arm/bin/arm-linux-androideabi-
export ARCH=arm
export SUBARCH=arm
export AOSP_ARCH=arm
clear
mkdir out
make O=out clean
make O=out mrproper
make O=out stic-cancro_defconfig
make O=out -j16