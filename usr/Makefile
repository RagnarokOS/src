# Makefile for /usr
# $Ragnarok: Makefile,v 1.2 2023/09/28 20:17:47 lecorbeau Exp $

MAKE = make -C

SUBDIRS = lib share bin

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
