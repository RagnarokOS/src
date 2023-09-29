# Makefile for /lib
# $Ragnarok: Makefile,v 1.3 2023/09/29 14:32:25 lecorbeau Exp $

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
