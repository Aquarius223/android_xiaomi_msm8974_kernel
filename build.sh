#!/bin/bash
clear
echo "###     kernel source by Ratoriku    ###"
echo "### Based on Mokee Opensource kernel ###"
echo "###  Kernel Build Script by Fatesay  ###"
export CROSS_COMPILE=$(pwd)/uber/bin/arm-linux-androideabi-
export ARCH=arm
export SUBARCH=arm
rm -rf arch/arm/boot/zImage
rm -rf out
mkdir -p out
make O=out clean
make O=out mrproper
make O=out cancro_defconfig
make O=out -j$(nproc --all)
