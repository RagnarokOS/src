# Makefile for /bin dir
# $Id: Makefile,v 1.9 2023/12/12 19:35:13 lecorbeau Exp $

MAKE	= make -C

# There will be many directories
SUBDIRS	= oksh ed

all:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir; \
		done

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done

clean:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir clean; \
		done

# If we're building deb packages
deb:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir deb; \
		done
