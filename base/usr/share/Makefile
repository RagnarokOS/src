# Makefile for /usr/share
# $Ragnarok: Makefile,v 1.13 2024/09/04 17:04:48 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= mk man

all: install

install:
	install -d ${DESTDIR}/usr/share/doc/nftables/examples
	install -d ${DESTDIR}/usr/share/doc/kernupd/hook
	install -d ${DESTDIR}/usr/share/doc/ragnarok
	install -d ${DESTDIR}/usr/share/ragnarok/syslinux
	install doc/nftables/examples/ragnarok.nft \
		${DESTDIR}/usr/share/doc/nftables/examples
	install doc/kernupd/hook/99kernel_update \
		${DESTDIR}/usr/share/doc/kernupd/hook
	install doc/ragnarok/ksh.profile \
		${DESTDIR}/usr/share/doc/ragnarok
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
	install ragnarok/syslinux/syslinux.cfg \
		${DESTDIR}/usr/share/ragnarok/syslinux
	install ragnarok/syslinux/zz-update-syslinux \
		${DESTDIR}/usr/share/ragnarok/syslinux
