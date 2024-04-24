# Makefile for /usr/share
# $Ragnarok: Makefile,v 1.12 2024/04/24 13:23:27 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= mk man

all: install

install:
	install -d ${DESTDIR}/usr/share/doc/nftables/examples
	install -d ${DESTDIR}/usr/share/doc/kernupd/hook
	install -d ${DESTDIR}/usr/share/doc/ragnarok
	install doc/nftables/examples/ragnarok.nft \
		${DESTDIR}/usr/share/doc/nftables/examples
	install doc/kernupd/hook/99kernel_update \
		${DESTDIR}/usr/share/doc/kernupd/hook
	install doc/ragnarok/ksh.profile \
		${DESTDIR}/usr/share/doc/ragnarok
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
