#!/bin/bash
# RAMDISK="/home/morfic/VIBDEV/voodoo/voodooka7/uncompressed/"
# RAMDISK="/home/morfic/VIBDEV/jpx-vibrant-kernel/initramfs-voodoo/"
RAMDISK="../ramdisk/"
# CCTC=~/VIBDEV/arm-2010q1/bin/arm-none-eabi-
CCTC="/home/morfic/VIBDEV/arm-2009q3/bin/arm-none-linux-gnueabi-"
# cd  Kernel
make ARCH=arm clean
make -j8 ARCH=arm CROSS_COMPILE=$CCTC prepare
make -j8 ARCH=arm CROSS_COMPILE=$CCTC modules
find -name *.ko -exec cp -v {} $RAMDISK/lib/modules/ \;
make -j8 ARCH=arm CROSS_COMPILE=$CCTC 
ls -alh arch/arm/boot/zImage
