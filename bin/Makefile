# Makefile for /bin dir
# $Id: Makefile,v 1.3 2023/08/21 17:08:44 lecorbeau Exp $

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
