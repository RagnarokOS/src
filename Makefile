# Construct the Ragnarok base system
# $Ragnarok: Makefile,v 1.7 2024/03/01 16:54:33 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= lib etc usr boot

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
