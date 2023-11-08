# Global Makefile for readline
# $Ragnarok: Makefile,v 1.1 2023/11/08 17:45:32 lecorbeau Exp $

MAKE	= make -C
VERSION	= 8.2

all:
	cd readline-${VERSION}; \
		./configure CC=clang \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		LDFLAGS="-Wl,-z,relro,-z,now" \
		--prefix=/usr --docdir=/usr/share/doc/readline-${VERSION} \
		--with-curses --disable-static \
	${MAKE} readline-${VERSION} SH_LIBS="-lncursesw"

install:
	${MAKE} readline-${VERSION} DESTDIR=${DESTDIR} SH_LIBS="-lncurses" install
	# Not yet
	#install -m 644 doc/*.ps ${DESTDIR}/usr/share/doc/readline-8.2
	#install -m 644 doc/*.pdf ${DESTDIR}/usr/share/doc/readline-8.2
	#install -m 644 doc/*.html ${DESTDIR}/usr/share/doc/readline-8.2
	#install -m 644 doc/*.dvi ${DESTDIR}/usr/share/doc/readline-8.2
