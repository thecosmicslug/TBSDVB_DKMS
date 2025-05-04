TBS_DTV_DKMS
============

This is a DKMS script for Building the TBS6285 (and many others) modules from https://github.com/tbsdtv.

Previously I had been using a build script to recompile the TBS modules after each upgrade, it involved rebooting into a new kernel and running the build script. then reloading the modules and restarting services depending on them.

When running a server providing DVB streaming and related services to clients, interuptions and repeated reboots like this cause an inconvenience to users!

this solution will make recompiling these modules after kernel updates much easier, 

Now the modules are built each time a new kernel is installed and I can simply reboot the computer into the new kernel with new TBS modules at a convenient time.

INSTALL
=======
<pre>
wget -N http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v1.0.tar.bz2
sudo tar jxvf tbs-tuner-firmwares_v1.0.tar.bz2 -C /lib/firmware/

cd /usr/src
sudo git clone https://github.com/thecosmicslug/TBSDVB_DKMS.git
sudo ln -s TBSDVB_DKMS TBSDVB_DKMS-github.com_tbsdtv

cd TBSDVB_DKMS
sudo git submodule update --init --recursive --depth=1
sudo dkms install -m TBSDVB_DKMS -v github.com_tbsdtv
</pre>

UPDATE
======
<pre>
cd /usr/src/TBSDVB_DKMS
sudo git fetch
sudo git submodule update --recursive --remote

sudo dkms remove TBSDVB_DKMS/github.com_tbsdtv -k $(uname -r)
sudo dkms install -m TBSDVB_DKMS -v github.com_tbsdtv
</pre>

CREDITS
=======
This was originally from: 
<pre>https://github.com/marcusbirkin/TBS_DTV_DKMS</pre>
but it did not build all the modules for me, so I have adapted it to build successfully on my TBS6285 card. 
other cards may well need to adjust module entries in the `dkms.conf` file. 

This resource was also very helpful in learning about DKMS and the build system:
<pre>https://electro-dan.co.uk/blog/16/tv-in-linux-using-the-geniatech-mygica-usb-tv-tuner-stick-t230a</pre>
