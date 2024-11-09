# Makefile for /usr
# $Ragnarok: Makefile,v 1.12 2024/11/09 18:48:53 lecorbeau Exp $

MAKE = make -C

SUBDIRS = lib share

all: install

install:
	install -d ${DESTDIR}/usr/bin
	install -d ${DESTDIR}/usr/share/ragnarok/keyrings
	install bin/kernupd ${DESTDIR}/usr/bin
	install share/ragnarok/keyrings/brave-browser-archive-keyring.gpg \
		${DESTDIR}/usr/share/ragnarok/keyrings
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
