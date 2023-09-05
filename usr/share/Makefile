# Makefile for /usr/share
# $Id: Makefile,v 1.1 2023/09/05 16:41:00 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= mk ragnarok-keys

all: 
	@# Nothing to do here, but do something to avoid make from running
	@# the 'install' target by default.
	@echo "Nothing to make in target 'all', skipping..."

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
