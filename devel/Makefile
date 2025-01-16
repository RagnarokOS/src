# Makefile for the devel set
# $Ragnarok: Makefile,v 1.3 2025/01/16 00:42:00 lecorbeau Exp $

PKG	= ragnarok-devel
VERSION	= 02
DESTDIR	= ${PKG}_${VERSION}_amd64

all:
	mkdir -p ${DESTDIR}
	cp -r DEBIAN ${DESTDIR}/

deb:
	dpkg-deb -b ${DESTDIR} . 2>&1 | tee ${PKG}_${VERSION}.build
