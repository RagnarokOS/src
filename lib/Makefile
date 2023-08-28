# Makefile for /lib
# $Id: Makefile,v 1.1 2023/08/28 17:33:54 lecorbeau Exp $

MAKE = make -C

SUBDIRS = libopenbsd

all:
	@for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir; \
		done

install:
	@for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done

clean:
	@for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir clean; \
		done
