# Global Makefile.
# $Ragnarok: Makefile,v 1.9 2025/03/21 16:09:11 lecorbeau Exp $

MAKE		= make -C
SUBDIRS		= etc usr var

## Section: create the Ragnarok-base package. See ragnarok-base.ebuild.

# Create basic directory structure
all:
	install -d ${DESTDIR}/etc
	install -d ${DESTDIR}/usr
	install -d ${DESTDIR}/var

# Target for Ragnarok-base
install: all
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done

## Section: make miniroot
miniroot:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir miniroot; \
		done

.PHONY: all base
