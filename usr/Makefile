# Makefile for /usr
# $Ragnarok: Makefile,v 1.3 2023/10/10 18:27:44 lecorbeau Exp $

MAKE = make -C

SUBDIRS = lib share bin sbin

all: 
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir; \
		done

miniroot:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir miniroot; \
		done

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
