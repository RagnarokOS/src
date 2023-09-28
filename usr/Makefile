# Makefile for /usr
# $Ragnarok: Makefile,v 1.1 2023/09/28 20:15:25 lecorbeau Exp $

MAKE = make -C

SUBDIRS = lib share bin

all: 
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir; \
		done

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
