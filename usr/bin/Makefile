# Makefile for usr/bin
# $Id: Makefile,v 1.2 2023/08/02 14:33:47 lecorbeau Exp $

MAKE	= make -C

SUBDIRS	= apply banner doas mandoc signify sysupdate

# miniroot.tgz requires less stuff
MINIROOTDIRS	= signify sysupdate

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
