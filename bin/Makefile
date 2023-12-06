# Makefile for /bin dir
# $Id: Makefile,v 1.8 2023/12/06 16:35:26 lecorbeau Exp $

MAKE	= make -C

# There will be many directories
SUBDIRS	= oksh ed
DEBS	= bash coreutils dash diffutils ed hostname oksh procps util-linux

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
	for _dir in ${DEBS}; do \
		${MAKE} $$_dir deb; \
		done
