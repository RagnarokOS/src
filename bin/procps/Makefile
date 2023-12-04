# Global Makefile for procps-ng
# $Ragnarok: Makefile,v 1.4 2023/12/04 16:31:24 lecorbeau Exp $

MAKE	= make -C
PKG	= procps
VERSION	= 4.0.2

DEBIAN	= changelog control rules

# If we're not building a deb package.
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

# Building a deb package
deb: src
	cp ${DEBIAN} ${PKG}-${VERSION}/debian/
	cd ${PKG}-${VERSION}; \
		dch -n -p; \
		/usr/bin/debuild -i -us -uc -b
