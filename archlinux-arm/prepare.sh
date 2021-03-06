#!/bin/bash

cd `dirname $0`

# Prepare qemu-arm-static
if [ ! -f qemu-arm-static ]; then
	cp /usr/bin/qemu-arm-static qemu-arm-static
fi

IMAGENAME=archlinux-arm

# Create archlinux-arm if it does not exist
RESULT=`docker images -q $IMAGENAME | wc -l`
if [ $RESULT -eq 0 ]; then
        docker import http://archlinuxarm.org/os/ArchLinuxARM-armv7-latest.tar.gz $IMAGENAME
fi

