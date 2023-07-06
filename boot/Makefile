# Makefile for the boot directory

all: install

install:
	install -d -m 755 -o root -g 0 ${DESTDIR}/grub
	install -d -m 755 -o root -g 0 ${DESTDIR}/syslinux
	install -m 600 -o root -g 0 grub/custom.cfg ${DESTDIR}/grub
	install -m 600 -o root -g 0 syslinux/syslinux.cfg ${DESTDIR}/syslinux

