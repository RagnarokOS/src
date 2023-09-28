# Makefile for /usr/share
# $Ragnarok: Makefile,v 1.2 2023/09/28 23:15:03 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= mk

all: 
	@# Nothing to do here, but do something to avoid make from running
	@# the 'install' target by default.
	@echo "Nothing to make in target 'all', skipping..."

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
