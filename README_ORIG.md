TBS DRIVER

Device driver for all TBS Devices DVB demodulator and modulator card/box

1)support product
1 pcie
tbs6910X tbs6910 tbs6910se tbs6916 tbs6216 tbs6909x
tbs6909SE tbs6909 tbs6908 tbs6904 tbs6904X
tbs6904SE tbs6902 tbs6902SE tbs6590 tbs6903 tbs6903x tbs6905
tbs6508 tbs6522 tbs6522H tbs6504 tbs7901 tbs6528 tbs6912
tbs6504H tbs6590X 
TBS6281 TBS6281SE TBS6205SE tbs6205 tbs6290 tbs6290se tbs7230 
tbs6209 tbs6209SE tbs6514 tbs6814 tbs6704 
tbs6302SE tbs6308 tbs6308X tbs6312X tbs6304 tbs6301 tbs6301se tbs6302x tbs6302T
tbs6302RV tbs6304X tbs6304T tbs6304RV tbs6324 tbs6322 tbs690a  tbs6331

tbs6900  tbs6004 tbs690b tbs6104 tbs6008 tbs6214 tbs6034 tbs6032 tbs6001

2 usb
tbs-qbox tbs-qbox2 tbs-qbox22 tbs-qboxs2 tbs-qbox2ci tbs5922se tbs5925 tbs5880
tbs5220 tbs5230 tbs5881 tbs5520 tbs5520se tbs5530 tbs5580 tbs5927 tbs5301 tbs5930 tbs5931 tbs5590

2)how to install the drivers?
it just need running the script of install.sh with root permission.



3)some common problems and their solutions
  a.SSL error: FFFFF80000002:....
    this is an issue related to the signature certificate and secret key.    you can ignore it , it will not affect the installtion and operation of the drivers. but you need enter the BIOS,disable secure boot.
  
  b.when you finished the drivers installed. but you can not get the adapters on /dev/dvb/.
  there are two steps to check it. (1) running command (lspci / lsusb) to check the hardware if detected by system; if not,please try to clean the pcie's finger or change to other pcie or usb port.
  (2)enter the BIOS, disable the secure boot.

  

