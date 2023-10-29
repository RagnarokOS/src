# Global Makefile for sysklogd
# $Ragnarok: Makefile,v 1.1 2023/10/29 15:28:28 lecorbeau Exp $

MAKE	= make -C

all:
	cd sysklogd; \
		./autogen.sh && \
		./configure CC=clang \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		LDFLAGS="-Wl,-z,relro,-z,now -Wl,-zdefs" \
		--disable-maintainer-mode --disable-static --without-logger \
		--prefix=/usr --sysconfdir=/etc --runstatedir=/run
	${MAKE} sysklogd

install:
	${MAKE} sysklogd DESTDIR=${DESTDIR} install
