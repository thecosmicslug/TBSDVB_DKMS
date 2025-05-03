TBS_DTV_DKMS
============

Very basic DKMS script for TBS DTV drivers from https://github.com/tbsdtv

DKMS will auto recompile these drivers on kernel updates

INSTALL
=======
<pre>
cd /usr/src
git clone https://github.com/thecosmicslug/TBSDVB_DKMS.git
ln -s TBSDVB_DKMS TBSDVB_DKMS-github.com_tbsdtv
cd TBSDVB_DKMS
git submodule update --init --recursive --depth=1
sudo dkms install -m TBSDVB_DKMS -v github.com_tbsdtv
</pre>

UPDATE
======
<pre>
cd /usr/src/TBS_DTV_DKMS
git fetch
git submodule update --recursive --remote
sudo dkms remove TBSDVB_DKMS/github.com_tbsdtv -k $(uname -r)
sudo dkms install -m TBSDVB_DKMS -v github.com_tbsdtv
</pre>
