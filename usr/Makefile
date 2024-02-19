# Makefile for /usr
# $Ragnarok: Makefile,v 1.4 2024/02/19 17:43:19 lecorbeau Exp $

MAKE = make -C

SUBDIRS = lib share bin sbin

all: 
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir; \
		done

dist:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir deb; \
		done

miniroot:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir miniroot; \
		done

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
