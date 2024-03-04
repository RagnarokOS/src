# Makefile for /usr/share
# $Ragnarok: Makefile,v 1.7 2024/03/04 19:11:34 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= mk

all: install

install:
	install -d ${DESTDIR}/usr/share/doc/nftables/examples
	install share/doc/nftables/examples/ragnarok.nft \
		${DESTDIR}/usr/share/doc/nftables/examples
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
