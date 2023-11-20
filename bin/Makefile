# Makefile for /bin dir
# $Id: Makefile,v 1.5 2023/11/20 18:09:06 lecorbeau Exp $

MAKE	= make -C

# There will be many directories
SUBDIRS	= cat date echo ls mv oksh ed rm rmdir sed

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
