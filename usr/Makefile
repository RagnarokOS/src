# Makefile for /usr
# $Ragnarok: Makefile,v 1.7 2024/03/04 18:55:54 lecorbeau Exp $

MAKE = make -C

SUBDIRS = lib share

all: install

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
