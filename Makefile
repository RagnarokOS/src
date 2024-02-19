# Construct the Ragnarok base system
# $Ragnarok: Makefile,v 1.6 2024/02/19 17:42:13 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= lib bin etc usr boot

all: 
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir; \
		done

# Build deb packages for the entire source tree.
dist:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir dist; \
		done

# Build miniroot files
miniroot:
	${MAKE} lib install
	${MAKE} bin install
	${MAKE} etc miniroot
	${MAKE} usr miniroot

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
