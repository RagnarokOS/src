# Makefile for /usr/share
# $Ragnarok: Makefile,v 1.16 2025/01/02 16:51:05 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= mk man

all: install

install:
	install -d ${DESTDIR}/usr/share/doc/nftables/examples
	install -d ${DESTDIR}/usr/share/doc/ragnarok
	install -d ${DESTDIR}/usr/share/keyrings
	install -d ${DESTDIR}/usr/share/ragnarok/syslinux
	install doc/nftables/examples/ragnarok.nft \
		${DESTDIR}/usr/share/doc/nftables/examples
	install doc/ragnarok/ksh.profile \
		${DESTDIR}/usr/share/doc/ragnarok
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
	install keyrings/apt.llvm.org.asc \
		${DESTDIR}/usr/share/keyrings
	install ragnarok/syslinux/syslinux.cfg \
		${DESTDIR}/usr/share/ragnarok/syslinux
	install ragnarok/syslinux/zz-update-syslinux \
		${DESTDIR}/usr/share/ragnarok/syslinux
	install ragnarok/syslinux/syslinux-install \
		${DESTDIR}/usr/share/ragnarok/syslinux
