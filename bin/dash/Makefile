# Global Makefile for dash shell
# $Ragnarok: Makefile,v 1.2 2023/11/29 19:38:33 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/progs.mk

MAKE	= make -C
VERSION	= 0.5.12

all: src
	cd dash-${VERSION}; \
		./configure CC=clang \
		CFLAGS="-g ${O_FLAG} ${HARDENING_CFLAGS}" \
		CPPFLAGS="-Wdate-time ${HARDENING_CPPFLAGS}" \
		LDFLAGS="${HARDENING_LDFLAGS}" \
		--bindir=/bin --prefix=/usr --includedir=/usr/include \
		--mandir=/usr/share/man --infodir=/usr/share/info \
		--sysconfdir=/etc --localstatedir=/var --disable-option-checking \
		--disable-silent-rules --libdir=/usr/lib/x86_64-linux-gnu \
		--runstatedir=/run --disable-maintainer-mode \
		--disable-dependency-tracking --disable-fnmatch \
		--disable-lineno --disable-glob
	${MAKE} dash-${VERSION}

src:
	/usr/bin/apt-get source dash

install:
	${MAKE} dash-${VERSION} DESTDIR=${DESTDIR} install
	cd ${DESTDIR}/bin; \
		ln -sf dash sh
	cd ${DESTDIR}/usr/share/man/man1; \
		ln -sf dash.1 sh.1
