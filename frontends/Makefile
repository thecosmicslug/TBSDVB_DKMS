# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the kernel DVB frontend device drivers.
#

ccflags-y += -I$(M)/tuners/



#cxd2820r-objs := cxd2820r_core.o cxd2820r_c.o cxd2820r_t.o cxd2820r_t2.o
#stv0900-objs := stv0900_core.o stv0900_sw.o

# Please keep it alphabetically sorted by Kconfig name
# (e. g. LC_ALL=C sort Makefile)

obj-$(CONFIG_DVB_CX24117) += cx24117.o
obj-$(CONFIG_DVB_SI2168) += si2168.o
obj-$(CONFIG_DVB_TAS2101) += tas2101.o

