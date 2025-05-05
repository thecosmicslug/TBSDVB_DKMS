DKMS for building the TBS6285 kernel modules.
========

INTRO
=======
TBS produce nice hardware, and the software IS open-source, but unfortunately the modules are not included in the Linux kernel for easy installation... but must be recompiled and installed after EVERY SINGLE kernel upgrade!!

I started following the instructions at [https://linuxtv.org/wiki/index.php/TBS_driver_installation](https://linuxtv.org/wiki/index.php/TBS_driver_installation) after every single bug-fix update my Home Media Server received and soon got fed up with that!

Next I had been using a build script to recompile the TBS modules after each upgrade. It involved rebooting into a new kernel and running the build script, then reloading the DVB-related modules and restarting services like [TVHeadend](https://tvheadend.org/) depending on them. This was only slightly better.

When running a media server providing DVB streaming and related services, interruptions and repeated reboots like this cause an inconvenience to users (and families!)

THE FIX
=======
This is my next solution, building upon the script this DKMS module will make recompiling these modules after kernel update much easier, 

Now the modules are built each time a new kernel is installed and I can simply reboot the computer into the new kernel with new TBS modules at a convenient time. (Not interrupting DVB recordings or user streaming!)

INSTALL
=======
First we must download the DVB firmware and place it in `/lib/firmware/`, this only has to be done once.
<pre>
wget -N http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v1.0.tar.bz2
sudo tar jxvf tbs-tuner-firmwares_v1.0.tar.bz2 -C /lib/firmware/
</pre>
Next clone this repo into `/usr/src`.
<pre>
cd /usr/src
sudo git clone https://github.com/thecosmicslug/TBSDVB_DKMS.git
sudo ln -s TBSDVB_DKMS TBSDVB_DKMS-github.com_tbsdtv
</pre>
Finally, enter `TBSDVB_DKMS` and install the DKMS module.
<pre>
cd TBSDVB_DKMS
sudo git submodule update --init --recursive --depth=1
sudo dkms install -m TBSDVB_DKMS -v github.com_tbsdtv
</pre>

UPDATE
======
To upgrade we first enter `/usr/src/TBSDVB_DKMS` and pull from GitHub.
<pre>
cd /usr/src/TBSDVB_DKMS
sudo git fetch
sudo git submodule update --recursive --remote
</pre>
Next we first remove the previous module, and install again. (using the updated sources)
<pre>
sudo dkms remove TBSDVB_DKMS/github.com_tbsdtv -k $(uname -r)
sudo dkms install -m TBSDVB_DKMS -v github.com_tbsdtv
</pre>

CREDITS
=======
I didn't understand DKMS when I was looking at this problem and I found this originally from: 
[github.com/marcusbirkin/TBS_DTV_DKMS](https://github.com/marcusbirkin/TBS_DTV_DKMS). But it did not build all the modules for me (just dvb-core.ko), so I have adapted it to build the required modules for my TBS6285 Quad TV-Tuner PCIe Card. 

Other cards may well need to adjust module entries in the `dkms.conf` file. 

[https://github.com/tbsdtv/linux_media/wiki](https://github.com/tbsdtv/linux_media/wiki) has been a great resource,
 along with the code at [https://github.com/tbsdtv/media_build](https://github.com/tbsdtv/media_build) and [https://github.com/tbsdtv/linux_media](https://github.com/tbsdtv/linux_media)

This resource was also very helpful in learning about DKMS and the TBS build system, it is for a different card though.
[https://electro-dan.co.uk/blog/16/tv-in-linux-using-the-geniatech-mygica-usb-tv-tuner-stick-t230a](https://electro-dan.co.uk/blog/16/tv-in-linux-using-the-geniatech-mygica-usb-tv-tuner-stick-t230a)
