# Makefile for usr/bin
# $Id: Makefile,v 1.5 2023/09/07 18:03:43 lecorbeau Exp $

MAKE	= make -C

# Some programs (e.g. mandoc) absolutely require running ./configure
# before 'make'.
CONFIGURE = mandoc

SUBDIRS	= apply banner doas mandoc signify sysupdate

# miniroot.tgz requires less stuff
MINIROOTDIRS	= signify sysupdate

all:
	echo "Pre-configuring..."
	@for _dir in ${CONFIGURE}; do \
		cd $$_dir && \
		./configure; \
		done
	echo "Running make..."
	@for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir; \
		done

miniroot:
	for _dir in ${MINIROOTDIRS}; do \
		${MAKE} $$_dir && \
		${MAKE} $$_dir install; \
		done

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done

clean:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir clean; \
		done
