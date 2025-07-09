# Global Makefile.
# $Ragnarok: Makefile,v 1.11 2025/07/09 16:25:03 lecorbeau Exp $

MAKE		= make -C
SUBDIRS		= etc

VERSION		= 02
KEYDIR		= ragnarok-keys-${VERSION}
PKG		= ragnarok-base-${VERSION}

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

keys:
	mkdir -p ${KEYDIR}
	install -m 644 etc/signify/ragnarok01.pub etc/signify/ragnarok02.pub ${KEYDIR}
	install -m 644 usr/share/openpgp-keys/lecorbeau.asc ${KEYDIR}
	tar czvf ${KEYDIR}.tgz ${KEYDIR}

## Section: make miniroot
miniroot:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir miniroot; \
		done

# Create release tarball for ragnarok-base ebuild.
release:
	mkdir ${PKG}
	for _dir in ${SUBDIRS}; do \
		install -d ${PKG}/$$_dir; \
		done
	for _dir in ${SUBDIRS}; do \
		DESTDIR=${CURDIR}/${PKG} ${MAKE} $$_dir install; \
		done

.PHONY: all base release
