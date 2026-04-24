#!/bin/sh
make install KERNELRELEASE=$kernelver
if [ -f tbs-tuner-firmwares*.tar.bz2 ]; then
		tar jxvf tbs-tuner-firmwares*.tar.bz2 -C /lib/firmware/
else
		echo "firmware file not exist!!!"		
fi
