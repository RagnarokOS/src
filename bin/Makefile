# Makefile for /bin dir
# $Ragnarok: Makefile,v 1.11 2024/02/22 16:46:19 lecorbeau Exp $

MAKE	= make -C

# There will be many directories
SUBDIRS	= ed

DEBS	= ed oksh

all:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir; \
		done

deb:
	for _deb in ${DEBS}; do \
		cd $$_deb; \
			dch -n -p; \
			debuild -i -us -uc -b; \
		cd ..; \
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
