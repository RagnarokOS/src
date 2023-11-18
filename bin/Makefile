# Makefile for /bin dir
# $Id: Makefile,v 1.4 2023/11/18 17:29:45 lecorbeau Exp $

MAKE	= make -C

# There will be many directories
SUBDIRS	= cat cp date echo ls mv oksh ed rm rmdir sed

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
