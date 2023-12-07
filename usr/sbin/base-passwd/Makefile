# Global Makefile for base-passwd
# $Ragnarok: Makefile,v 1.2 2023/12/07 18:57:27 lecorbeau Exp $

MAKE	= make -c
PKG	= base-passwd
VERSION	= 3.6.1

DEBIAN	= changelog control rules
FILES	= group.master passwd.master

all:
	cd base-passwd-${VERSION}; \
		autoreconf --install --force && \
		./configure CC=clang \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		LDFLAGS="-Wl,-z,relro,-z,now" \
		--disable-debconf --disable-docs
	${MAKE} base-passwd-${VERSION}

src:
	/usr/bin/apt-get source base-passwd

install:
	${MAKE} base-passwd-${VERSION} DESTDIR=${DESTDIR} install
	install -d ${DESTDIR}/usr/share/doc/base-passwd
	install -m 644 ${DOCS} \
		${DESTDIR}/usr/share/doc/base-passwd

# Building a deb package
deb: src
	cp ${DEBIAN} ${PKG}-${VERSION}/debian/
	cp ${FILES} ${PKG}-${VERSION}/
	cd ${PKG}-${VERSION}; \
		dch -n -p; \
		/usr/bin/debuild -i -us -uc -b
