# Construct the Ragnarok base system
# $Ragnarok: Makefile,v 1.3 2023/09/29 14:29:44 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= lib etc bin usr boot

all: 
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir; \
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
