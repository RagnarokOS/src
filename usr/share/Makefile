# Makefile for /usr/share
# $Ragnarok: Makefile,v 1.3 2023/10/09 16:41:29 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= mk

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
