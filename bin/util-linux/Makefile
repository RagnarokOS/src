# Global Makefile for util-linux
# $Ragnarok: Makefile,v 1.3 2023/10/25 17:12:08 lecorbeau Exp $

MAKE	= make -C
VERSION	= 2.39.1

all:
	cd util-linux-${VERSION}; \
		./configure \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-clash-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		LDFLAGS="-Wl,-z,relro,-z,now -Wl,-zdefs" \
		--disable-chfn-chsh --disable-login --disable-nologin \
		--disable-cal --disable-kill --disable-hwclock-gplv3 \
		--disable-pylibmount --disable-static --without-python \
		--without-systemd --without-systemdsystemunitdir
	${MAKE} util-linux-${VERSION}

install:
	${MAKE} util-linux-${VERSION} DESTDIR=${DESTDIR} install
