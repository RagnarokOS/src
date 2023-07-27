# Makefile for usr/bin
# $Id: Makefile,v 1.1 2023/07/27 17:14:06 lecorbeau Exp $

MAKE	= make -C

# There will be many directories
SUBDIRS	= mandoc sysupdate

# miniroot.tgz requires less stuff
MINIROOTDIRS	= sysupdate

miniroot:
	for _dir in ${MINIROOTDIRS}; do \
		${MAKE} $$_dir && \
		${MAKE} $$_dir install; \
		done

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir && \
		${MAKE} $$_dir install; \
		done

clean:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir clean; \
		done
