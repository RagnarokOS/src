# Global Makefile for util-linux
# $Ragnarok: Makefile,v 1.2 2023/10/25 16:58:19 lecorbeau Exp $

MAKE	= make -C
VERSION	= 2.39.1

all:
	cd util-linux-${VERSION}; \
		./configure \
		--disable-chfn-chsh --disable-login --disable-nologin \
		--disable-cal --disable-kill --disable-hwclock-gplv3 \
		--disable-pylibmount --disable-static --without-python \
		--without-systemd --without-systemdsystemunitdir
	${MAKE} util-linux-${VERSION}

install:
	${MAKE} util-linux-${VERSION} DESTDIR=${DESTDIR} install
