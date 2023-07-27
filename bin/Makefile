# Makefile for /bin dir
# $Id: Makefile,v 1.2 2023/07/27 16:44:13 lecorbeau Exp $

MAKE	= make -C

# There will be many directories
SUBDIRS	= oksh

# miniroot.tgz requires less stuff
MINIROOTDIRS	= oksh

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
