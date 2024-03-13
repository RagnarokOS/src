# Makefile for /usr/share
# $Ragnarok: Makefile,v 1.11 2024/03/13 16:54:45 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= mk man

all: install

install:
	install -d ${DESTDIR}/usr/share/doc/nftables/examples
	install -d ${DESTDIR}/usr/share/doc/kernupd/hook
	install doc/nftables/examples/ragnarok.nft \
		${DESTDIR}/usr/share/doc/nftables/examples
	install doc/kernupd/hook/99kernel_update \
		${DESTDIR}/usr/share/doc/kernupd/hook
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
