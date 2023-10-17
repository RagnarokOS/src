# Construct the Ragnarok base system
# $Ragnarok: Makefile,v 1.4 2023/10/17 16:42:49 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= lib bin etc usr boot

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
