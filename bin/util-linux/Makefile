# Global Makefile for util-linux
# $Ragnarok: Makefile,v 1.9 2023/11/26 19:25:07 lecorbeau Exp $

MAKE	= make -C
VERSION	= 2.38.1

all: src
	cd util-linux-${VERSION}; \
		./configure \
		CC=clang YACC=/usr/bin/yacc \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		LDFLAGS="-Wl,-z,relro,-z,now -Wl,--as-needed" \
		--bindir=/bin --prefix=/usr --datarootdir=/usr \
		--includedir=/usr/include --infodir=/usr/share/info \
		--libdir=/usr/lib/x86_64-linux-gnu --libexecdir=/usr/libexec \
		--localedir=/usr/locale --localstatedir=/var --mandir=/usr/share/man \
		--runstatedir=/run --sbindir=/sbin sysconfdir=/etc \
		--usrbin_execdir=/usr/bin --usrsbin_execdir=/usr/sbin \
		--usrlib_execdir=/usr/lib/x86_64-linux-gnu \
		--disable-chfn-chsh --disable-login --disable-nologin \
		--disable-cal --disable-kill --disable-hwclock-gplv3 \
		--disable-pylibmount --disable-static --without-python \
		--without-systemd --without-systemdsystemunitdir \
		--enable-write --with-selinux --with-smack \
		--with-cryptsetup=dlopen --enable-partx \
	${MAKE} util-linux-${VERSION}

src:
	/usr/bin/apt-get source util-linux

install:
	${MAKE} util-linux-${VERSION} DESTDIR=${DESTDIR} install
