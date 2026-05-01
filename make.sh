#!/bin/sh
git fetch
if [ -z "$kernelver" ]; then kernelver=`uname -r` ; fi
make clean
make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null) KERNELRELEASE=$kernelver
