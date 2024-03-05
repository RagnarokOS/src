# Makefile for /usr/share
# $Ragnarok: Makefile,v 1.8 2024/03/05 01:27:22 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= mk

all: install

install:
	install -d ${DESTDIR}/usr/share/doc/nftables/examples
	install doc/nftables/examples/ragnarok.nft \
		${DESTDIR}/usr/share/doc/nftables/examples
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
