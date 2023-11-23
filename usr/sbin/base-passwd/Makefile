# Global Makefile for base-passwd
# $Ragnarok: Makefile,v 1.1 2023/11/23 21:14:55 lecorbeau Exp $

MAKE	= make -c
VERSION	= 3.6.1

DOCS	= doc/README doc/users-and-groups.html doc/users-and-groups.txt

all:
	cd base-passwd-${VERSION}; \
		autoreconf --install --force && \
		./configure CC=clang \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		LDFLAGS="-Wl,-z,relro,-z,now" \
		--disable-debconf --disable-docs
	${MAKE} base-passwd-${VERSION}

install:
	${MAKE} base-passwd-${VERSION} DESTDIR=${DESTDIR} install
	install -d ${DESTDIR}/usr/share/doc/base-passwd
	install -m 644 ${DOCS} \
		${DESTDIR}/usr/share/doc/base-passwd
