# Makefile for /usr
# $Ragnarok: Makefile,v 1.8 2024/03/12 23:48:56 lecorbeau Exp $

MAKE = make -C

SUBDIRS = lib share

all: install

install:
	install -d ${DESTDIR}/usr/bin
	install bin/kernupd ${DESTDIR}/usr/bin
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
