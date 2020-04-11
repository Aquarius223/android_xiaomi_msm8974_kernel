#!/bin/bash
export CROSS_COMPILE=/home/stic/桌面/msm8974/arm-eabi-4.9.4/bin/arm-eabi-
export ARCH=arm
export SUBARCH=arm
mkdir out
make O=out stic-cancro_defconfig
make O=out -j16