#!/bin/sh
git fetch
git submodule update --recursive --remote
cd media_build 
if [ -z "$kernelver" ]; then kernelver=`uname -r` ; fi
make rmmod
make dir DIR=../media KERNELRELEASE=$kernelver
make distclean
make allyesconfig KERNELRELEASE=$kernelver
#cp dkms_built.config v4l/.config
sed -i -r 's/(^CONFIG.*_RC.*=)./\1n/g' v4l/.config
sed -i -r 's/(^CONFIG.*_IR.*=)./\1n/g' v4l/.config
#CONFIG_SND_USB_AUDIO ?
sed -i -r 's/CONFIG_SND_USB_AUDIO=m/CONFIG_SND_USB_AUDIO=y/' v4l/.config
make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null) KERNELRELEASE=$kernelver
