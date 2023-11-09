# Global Makefile for readline
# $Ragnarok: Makefile,v 1.4 2023/11/09 16:56:11 lecorbeau Exp $

MAKE	= make -C
VERSION	= 8.2

all:
	cd readline-${VERSION}; \
		./configure CC=clang \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		LDFLAGS="-Wl,-z,relro,-z,now" \
		--prefix=/usr --docdir=/usr/share/doc/readline-${VERSION} \
		--with-curses --disable-static
	${MAKE} readline-${VERSION} SH_LIBS="-lncursesw"

install:
	${MAKE} readline-${VERSION} DESTDIR=${DESTDIR} SH_LIBS="-lncursesw" install
