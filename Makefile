# --- Variables ---
# Use ?= to allow environment overrides

kernelver ?= $(shell uname -r)
KDIR	?= /lib/modules/$(kernelver)/build
PWD	:= $(shell pwd)
MDIR	?=

# --- Module Configurations ---
MODDEFS := CONFIG_DVB_CORE=m \
	   CONFIG_DVB_TBSECP3=m \
	CONFIG_TBS_PCIE_CI=m \
	CONFIG_TBS_PCIE_MOD=m \
	CONFIG_SAA716X_CORE=m \
	CONFIG_DVB_SAA716X_TBS=m \
	CONFIG_DVB_SAA716X_HYBRID=m  \
	CONFIG_DVB_SI2168=m \
	CONFIG_DVB_TAS2101=m \


# --- Compilation Flags ---
EXTRA_CFLAGS += --include=$(PWD)/include/kernel_compat.h
EXTRA_CFLAGS += -I$(PWD)/include \
                -I$(PWD)/include/linux \
                -I$(PWD)/dvb-core \
                -I$(PWD)/frontends \
                -I$(PWD)/stid135 \
                -I$(PWD)/tuners

EXTRA_CFLAGS += -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0
# --- Targets ---
.PHONY: all install clean dep

# Build modules using Kbuild M= syntax
all: 
	$(MAKE) -C $(KDIR) M=$(PWD) $(MODDEFS) NOSTDINC_FLAGS="$(EXTRA_CFLAGS)" modules

dep:
	$(MAKE) -C $(KDIR) M=$(PWD) dep

install: all
	$(MAKE) -C $(KDIR) M=$(PWD) INSTALL_MOD_PATH=$(MDIR) modules_install
	@echo "Updating module dependencies..."
	@if [ -n "$(MDIR)" ]; then \
		depmod -b "$(MDIR)" -a $(kernelver); \
	else \
		depmod -a $(kernelver); \
	fi

clean:
	@echo "Cleaning up..."
	@find . -type f -name "*.o" -o -name "*.ko" -o -name "*.mod" -o \
	              -name "*.mod.c" -o -name ".*.cmd" -o -name ".*.o.d" -o \
	              -name "*.order" -o -name "*.dwo" -o -name "modules.order" -o \
	              -name "Module.symvers" | xargs rm -f
	@rm -rf .tmp_versions
