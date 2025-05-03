#!/bin/sh
wget -N http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v1.0.tar.bz2
tar jxvf tbs-tuner-firmwares_v1.0.tar.bz2 -C /lib/firmware/

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

echo "Compiling TBS Drivers..."
make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null) KERNELRELEASE=$kernelver
