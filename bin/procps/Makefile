# Global Makefile for procps-ng
# $Ragnarok: Makefile,v 1.3 2023/11/25 18:21:00 lecorbeau Exp $

MAKE	= make -C
VERSION	= 4.0.2

all: src
	cd procps-${VERSION}; \
		./configure CC=clang \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		LDFLAGS="-Wl,-z,relro,-z,now -Wl,--as-needed" \
		--prefix=/usr --exec-prefix=/ \
		--libdir=/usr/lib/x86_64-linux-gnu \
		--enable-watch8bit --enable-w-from \
		--disable-static --disable-modern-top \
		--disable-kill --disable-pidof \
		--with-elogind
	${MAKE} procps-${VERSION}

src:
	/usr/bin/apt-get source procps

install:
	${MAKE} procps-${VERSION} DESTDIR=${DESTDIR} install
