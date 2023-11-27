# Global Makefile for util-linux
# $Ragnarok: Makefile,v 1.13 2023/11/27 18:12:42 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/progs.mk

MAKE		= make -C
VERSION		= 2.38.1

PAMFILES	= files/runuser files/runuser-l files/su.pam files/su-l.pam

all: src
	cd util-linux-${VERSION}; \
		./configure \
		CC=clang CXX=clang++ YACC=/usr/bin/yacc \
		CFLAGS="-g ${O_FLAG} ${HARDENING_CFLAGS}" \
		CPPFLAGS="${HARENING_CPPFLAGS}" \
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
		--enable-asan --enbale-ubsan
	${MAKE} util-linux-${VERSION}

src:
	/usr/bin/apt-get source util-linux

install:
	${MAKE} util-linux-${VERSION} DESTDIR=${DESTDIR} install
