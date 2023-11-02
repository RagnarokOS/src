# Global Makefile for m4
# $Ragnarok: Makefile,v 1.1 2023/11/02 16:58:06 lecorbeau Exp $

MAKE	= make -C
VERSION	= 1.4.19

all:
	cd m4-${VERSION}; \
		./configure CC=clang \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		LDFLAGS="-Wl,-z,relro,-z,now -Wl,-zdefs" \
		--prefix=/usr
	${MAKE} m4-${VERSION}

install:
	${MAKE} m4-${VERSION} DESTDIR=${DESTDIR} install
