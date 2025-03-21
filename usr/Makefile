# Makefile for usr dir
# $Ragnarok: Makefile,v 1.1 2025/03/21 16:55:57 lecorbeau Exp $

install:
	install -d ${DESTDIR}/usr/src
	install -m 644 src/ragnarok.config \
		${DESTDIR}/usr/src

miniroot:
	install -d ${DESTDIR}/usr/share/openpgp-keys
	install -m 644 share/openpgp-keys/lecorbeau.asc \
		${DESTDIR}/usr/share/openpgp-keys
