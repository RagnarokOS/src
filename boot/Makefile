# Makefile for the boot directory
# $Ragnarok: Makefile,v 1.2 2023/10/17 16:46:53 lecorbeau Exp $

all: 
	@echo "Nothing to do for 'all', skipping..."

install:
	install -d -m 755 -o root -g 0 ${DESTDIR}/boot/grub; \
	install -m 600 -o root -g 0 grub/custom.cfg ${DESTDIR}/boot/grub; \

