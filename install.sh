#!/bin/sh
cd build/media_build
cd ../build/media_build
rm -r -f /lib/modules/$(uname -r)/updates/extra
make install KERNELRELEASE=$kernelver
make rmmod
