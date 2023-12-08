# Global Makefile for dpkg
# $Ragnarok: Makefile,v 1.9 2023/12/08 17:06:43 lecorbeau Exp $

MAKE	= make -C
PKG	= dpkg
VERSION	= 1.21.22

DEBIAN	= changelog control rules

all: src
	cd dpkg-${VERSION}; \
		./configure CC=clang \
		$(shell dpkg-buildflags --export=configure) \
		--prefix=/usr --sbindir=/sbin --libexecdir=/usr/lib \
		--sysconfdir=/etc --localstatedir=/var --runstatedir=/run \
		--libdir=/usr/lib/x86_64-linux-gnu --includedir=/usr/include \
		--oldincludedir=/usr/include --datarootdir=/usr/share \
		--infodir=/usr/share/info --mandir=/usr/share/man \
		--docdir=/usr/share/doc/dpkg --with-devlibdir=/usr/lib/x86_64-linux-gnu \
		--disable-dselect --with-libselinux \
		--with-libz --with-liblzma --with-libzstd \
		--with-libbz2
	${MAKE} dpkg-${VERSION}

src:
	/usr/bin/apt-get source dpkg

install:
	${MAKE} dpkg-${VERSION} DESTDIR=${DESTDIR} install
	mkdir -p ${DESTDIR}/etc/cron.daily
	mkdir -p ${DESTDIR}/etc/logrotate.d
	mkdir -p ${DESTDIR}/usr/share/lintian/profiles/dpkg
	mkdir -p ${DESTDIR}/usr/share/lintian/overrides
	install -m 755 -g 0 -o root files/dpkg.cron.daily \
		${DESTDIR}/etc/cron.daily/dpkg
	install -m 644 -g 0 -o root files/dpkg.logrotate \
		${DESTDIR}/etc/logrotate.d/dpkg
	install -m 644 -g 0 -o root files/dpkg.alternatives.logrotate \
		${DESTDIR}/etc/logrotate.d/alternatives
	install -m 644 -g 0 -o root files/dpkg.cfg \
		${DESTDIR}/etc/dpkg
	cp files/dpkg.lintian-profile \
	   ${DESTDIR}/usr/share/lintian/profiles/dpkg/main.profile
	cp files/dpkg.lintian-overrides \
	   ${DESTDIR}/usr/share/lintian/overrides/dpkg

# Building a deb package
deb: src
	cp ${DEBIAN} ${PKG}-${VERSION}/debian/
	cd ${PKG}-${VERSION}; \
		dch -n -p; \
		/usr/bin/debuild -i -us -uc -b
