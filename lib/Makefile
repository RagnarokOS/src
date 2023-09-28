# Makefile for /lib
# $Ragnarok: Makefile,v 1.2 2023/09/28 20:11:36 lecorbeau Exp $

MAKE = make -C

SUBDIRS = libopenbsd

all:
	@for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir; \
		done

miniroot:
	@for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir miniroot; \
		done

install:
	@for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done

clean:
	@for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir clean; \
		done
