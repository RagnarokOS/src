# Construct the Ragnarok base system
# $Ragnarok: Makefile,v 1.2 2023/09/28 16:43:53 lecorbeau Exp i $

MAKE = make -C

SUBDIRS	= lib etc bin usr boot

all: 
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir; \
		done

# Build miniroot files
miniroot:
	${MAKE} lib miniroot
	${MAKE} etc miniroot
	${MAKE} bin miniroot
	${MAKE} usr miniroot

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
