# Makefile for /usr
# $Ragnarok: Makefile,v 1.5 2024/03/04 17:42:59 lecorbeau Exp $

MAKE = make -C

SUBDIRS = lib share

all: install

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
