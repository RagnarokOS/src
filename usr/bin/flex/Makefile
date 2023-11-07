# Global Makefile for flex
# $Ragnarok: Makefile,v 1.2 2023/11/07 20:51:41 lecorbeau Exp $

MAKE	= make -C
VERSION	= 2.6.4

all:
	cd flex-${VERSION}; \
		./configure CC=clang \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		LDFLAGS="-Wl,-z,relro,-z,now" \
		--prefix=/usr --disable-static
	${MAKE} flex-${VERSION}

install:
	${MAKE} flex-${VERSION} DESTDIR=${DESTDIR} install
	cd ${DESTDIR}/usr/bin; \
		ln -sv flex lex
	cd ${DESTDIR}/usr/share/man/man1; \
		ln -sv flex.1 lex.1
