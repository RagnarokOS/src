# Global Makefile for dash shell
# $Ragnarok: Makefile,v 1.4 2023/12/07 17:35:51 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/progs.mk

MAKE	= make -C
PKG	= dash
VERSION	= 0.5.12

DEBIAN	= changelog control rules

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
	install -d ${DESTDIR}/usr/share/debianutils/shells.d
	install -m 644 -g 0 -o root dash-${VERSION}/debian/shells.d/dash \
		${DESTDIR}/usr/share/debianutils/shells.d
	cd ${DESTDIR}/bin; \
		ln -sf dash sh
	cd ${DESTDIR}/usr/share/man/man1; \
		ln -sf dash.1 sh.1

# Building a deb package
deb: src
	cp ${DEBIAN} ${PKG}-${VERSION}/debian/
	cd ${PKG}-${VERSION}; \
		dch -n -p; \
		/usr/bin/debuild -i -us -uc -b
