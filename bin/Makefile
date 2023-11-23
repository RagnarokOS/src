# Makefile for /bin dir
# $Id: Makefile,v 1.6 2023/11/23 16:27:33 lecorbeau Exp $

MAKE	= make -C

# There will be many directories
SUBDIRS	= oksh ed sed

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
