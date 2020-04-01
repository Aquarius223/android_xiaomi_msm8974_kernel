#!/bin/bash
clear
echo "###     Kernel Source by Ratoriku    ###"
echo "### Based on Mokee Opensource kernel ###"
echo "###  Kernel Build Script by Fatesay  ###"
export CROSS_COMPILE=/home/ratoriku/kernel/32_toolchain/ubertc/bin/arm-linux-androideabi-
export ARCH=arm
export SUBARCH=arm
rm -rf out
mkdir -p out
make O=out clean
make O=out mrproper
make O=out cancro_defconfig
make O=out -j$(nproc --all)
