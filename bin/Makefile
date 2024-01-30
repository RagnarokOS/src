# Makefile for /bin dir
# $Ragnarok: Makefile,v 1.10 2024/01/30 18:27:07 lecorbeau Exp $

MAKE	= make -C

# There will be many directories
SUBDIRS	= ed

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
