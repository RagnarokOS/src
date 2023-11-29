# Global Makefile for dash shell
# $Ragnarok: Makefile,v 1.1 2023/11/29 16:43:37 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/progs.mk

MAKE	= make -C
VERSION	= 0.5.12

all: src
	cd dash-${VERSION}; \
		./configure CC=clang \
		CFLAGS="-g ${O_FLAG} ${HARDENING_CFLAGS}" \
		CPPFLAGS="-Wdate-time ${HARDENING_CPPFLAGS}" \
		LDFLAGS="${HARDENING_LDFLAGS}" \
		--disable-fnmatch --disable-lineno \
		--disable-glob
	${MAKE} dash-${VERSION}

src:
	/usr/bin/apt-get source dash

install:
	${MAKE} dash-${VERSION} DESTDIR=${DESTDIR} install
