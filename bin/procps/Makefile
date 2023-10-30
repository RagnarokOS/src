# Global Makefile for procps-ng
# $Ragnarok: Makefile,v 1.2 2023/10/30 18:05:43 lecorbeau Exp $

MAKE	= make -C
VERSION	= 4.0.3

all:
	cd procps-ng-${VERSION}; \
		./configure CC=clang \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		LDFLAGS="-Wl,-z,relro,-z,now -Wl,-zdefs" \
		--prefix=/usr --exec-prefix=/ \
		--disable-static --disable-modern-top \
		--disable-kill \
		--disable-pidof
	${MAKE} procps-ng-${VERSION}

install:
	${MAKE} procps-ng-${VERSION} DESTDIR=${DESTDIR} install
