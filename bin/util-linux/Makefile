# Global Makefile for util-linux
# $Ragnarok: Makefile,v 1.11 2023/11/27 00:35:49 lecorbeau Exp $

MAKE		= make -C
VERSION		= 2.38.1

PAMFILES	= files/runuser files/runuser-l files/su.pam files/su-l.pam

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
		--localedir=/usr/share/locale --localstatedir=/var --mandir=/usr/share/man \
		--runstatedir=/run --sbindir=/sbin sysconfdir=/etc \
		--disable-chfn-chsh --disable-login --disable-nologin \
		--disable-cal --disable-kill --disable-hwclock-gplv3 \
		--disable-pylibmount --disable-static --without-python \
		--without-systemd --without-systemdsystemunitdir \
		--enable-write --with-selinux --with-smack \
		--with-cryptsetup=dlopen --enable-partx
	${MAKE} util-linux-${VERSION}

src:
	/usr/bin/apt-get source util-linux

install:
	${MAKE} util-linux-${VERSION} DESTDIR=${DESTDIR} install
	install -m 644 -g 0 -o root file/hwclock.rules \
		${DESTDIR}/usr/lib/udev/rules.d/85-hwclock-rules
	install -m 755 -g 0 -o root files/hwclock-set \
		${DESTDIR}/usr/lib/udev/hwclock-set
	install -m 755 -g 0 -o root files/hwclock.sh.init \
		${DESTDIR}/etc/init.d/hwclock.sh
	install -m 644 -g 0 -o root files/hwclock.default \
		${DESTDIR}/etc/default/hwclock
	install -m 644 -g 0 -o root ${PAMFILES} \
		${DESTDIR}/etc/pam.d
	install -m 644 -g 0 -o root files/hwclock.5 \
		${DESTDIR}/usr/share/man/man5
