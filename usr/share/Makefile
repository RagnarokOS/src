# Makefile for /usr/share
# $Ragnarok: Makefile,v 1.6 2024/03/04 17:45:53 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= mk

all: install

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
