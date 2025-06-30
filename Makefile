# Global Makefile.
# $Ragnarok: Makefile,v 1.10 2025/06/30 16:02:27 lecorbeau Exp $

MAKE		= make -C
SUBDIRS		= etc usr var

VERSION		= 02
KEYDIR		= ragnarok-keys-${VERSION}

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

.PHONY: all base
