# Makefile for /usr/share
# $Ragnarok: Makefile,v 1.4 2023/11/27 16:55:23 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= man mk

all: 
	@# Nothing to do here, but do something to avoid make from running
	@# the 'install' target by default.
	@echo "Nothing to make in target 'all', skipping..."

miniroot:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
