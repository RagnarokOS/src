# Makefile for /bin dir
# $Id: Makefile,v 1.7 2023/11/30 19:05:52 lecorbeau Exp $

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
