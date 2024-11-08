# Makefile for /usr
# $Ragnarok: Makefile,v 1.9 2024/11/08 18:05:27 lecorbeau Exp $

MAKE = make -C

SUBDIRS = lib share

all: install

install:
	install -d ${DESTDIR}/usr/bin
	install -d ${DESTDIR}/usr/share/keyrings
	install bin/kernupd ${DESTDIR}/usr/bin
	install share/keyrings/brave-browser-archive-keyring.gpg \
		${DESTDIR}/usr/share/keyrings
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
