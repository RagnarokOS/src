# Makefile for the boot directory
# $Ragnarok: Makefile,v 1.1 2023/09/29 15:17:40 lecorbeau Exp $

all: 
	@echo "Nothing to do for 'all', skipping..."

install:
	@if [ -d /sys/firmware/efi ]; then \
		install -d -m 755 -o root -g 0 ${DESTDIR}/grub; \
		install -m 600 -o root -g 0 grub/custom.cfg ${DESTDIR}/grub; \
	else \
		install -d -m 755 -o root -g 0 ${DESTDIR}/syslinux; \
		install -m 600 -o root -g 0 syslinux/syslinux.cfg ${DESTDIR}/syslinux; \
	fi

