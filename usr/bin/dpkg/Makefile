# Global Makefile for dpkg
# $Ragnarok: Makefile,v 1.3 2023/11/24 18:40:18 lecorbeau Exp $

MAKE	= make -C
VERSION	= 1.21.22

all: src
	cd dpkg-${VERSION}; \
		./configure CC=clang \
		# Try dpkg-buildflags
		$(shell dpkg-buildflags --export=configure) \
		--prefix=/usr --sbindir=/sbin --libexecdir=/usr/lib \
		--with-devlibdir=/usr/lib/x86_64-linux-gnu \
		--disable-dselect --with-libselinux \
		--with-libz --with-liblzma --with-libzstd \
		--with-libbz2
	${MAKE} dpkg-${VERSION}

src:
	/usr/bin/apt-get source dpkg

install:
	${MAKE} dpkg-${VERSION} DESTDIR=${DESTDIR} install
	mkdir -p ${DESTDIR}/usr/share/lintian/profiles/dpkg
	cp files/dpkg.lintian-profile \
	   ${DESTDIR}/usr/share/lintian/profiles/dpkg/main.profile
