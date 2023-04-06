# SPDX-License-Identifier: GPL-2.0

# KDIR ?= /lib/modules/`uname -r`/build
KDIR ?= ../linux

default:
	$(MAKE) LLVM=1 CLIPPY=1 -j$(nproc) -C $(KDIR) M=$$PWD
