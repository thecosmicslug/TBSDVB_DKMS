#!/bin/sh
git fetch
git submodule update --recursive --remote
cd media_build 
if [ -z "$kernelver" ]; then kernelver=`uname -r` ; fi
make rmmod
make dir DIR=../media KERNELRELEASE=$kernelver
make distclean
make allyesconfig KERNELRELEASE=$kernelver
sed -i -r 's/(^CONFIG.*_RC.*=)./\1n/g' v4l/.config
sed -i -r 's/(^CONFIG.*_IR.*=)./\1n/g' v4l/.config
# Try force snd-usb-audio module
sed -i -r 's/^\(CONFIG_SND_USB=\).*/\1m/' v4l/.config
sed -i -r 's/^\(CONFIG_SND_USB_AUDIO=\).*/\1m/' v4l/.config
make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null) KERNELRELEASE=$kernelver