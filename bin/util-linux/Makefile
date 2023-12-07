# Global Makefile for util-linux
# $Ragnarok: Makefile,v 1.20 2023/12/07 00:10:38 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/progs.mk

MAKE		= make -C
PKG		= util-linux
VERSION		= 2.38.1

DEBIAN		= debian

all: src
	cd util-linux-${VERSION}; \
		./configure \
		CC=clang CXX=clang++ YACC=/usr/bin/yacc \
		CFLAGS="-g ${O_FLAG} ${HARDENING_CFLAGS}" \
		CPPFLAGS="-Wdate-time ${HARDENING_CPPFLAGS}" \
		CXXFLAGS="-g ${O_FLAG} ${HARDENING_CFLAGS}" \
		LDFLAGS="${HARDENING_LDFLAGS}" \
		--bindir=/bin --prefix=/usr --datarootdir=/usr \
		--includedir=/usr/include --infodir=/usr/share/info \
		--libdir=/usr/lib/x86_64-linux-gnu --libexecdir=/usr/libexec \
		--localedir=/usr/share/locale --localstatedir=/var --mandir=/usr/share/man \
		--runstatedir=/run --sbindir=/sbin sysconfdir=/etc \
		--disable-chfn-chsh --disable-login --disable-nologin \
		--disable-cal --disable-kill --disable-hwclock-gplv3 \
		--disable-pylibmount --disable-static --without-python \
		--without-systemd --without-systemdsystemunitdir \
		--enable-write --with-selinux --with-smack \
		--with-cryptsetup=dlopen --enable-partx \
		--enable-asan --enable-ubsan
	${MAKE} util-linux-${VERSION}

src:
	/usr/bin/apt-get source util-linux

install:
	${MAKE} util-linux-${VERSION} DESTDIR=${DESTDIR} install
	rm -f ${DESTDIR}/usr/lib/*/*.la
	find ${DESTDIR}/usr/lib -name 'lib*.a' \! -name 'libuuid.a' \! -name 'libblkid.a' -delete

# Building a deb package
deb: src
	cp -r ${DEBIAN} ${PKG}-${VERSION}/
	cd ${PKG}-${VERSION}; \
		dch -n -p; \
		/usr/bin/debuild -i -us -uc -b
