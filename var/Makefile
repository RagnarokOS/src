# Makefile for var dir and subdirs
# $Ragnarok: Makefile,v 1.1 2025/03/21 17:07:38 lecorbeau Exp $

SUBDIRS		= lib/portage

miniroot:
	for _dir in ${SUBDIRS}; do \
		install -d ${DESTDIR}/$$_dir; \
		done
	install -m 644 lib/portage/world \
		${DESTDIR}/var/lib/portage
