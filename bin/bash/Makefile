# Global Makefile for bash
# $Ragnarok: Makefile,v 1.1 2023/12/04 16:41:38 lecorbeau Exp $

MAKE	= make -C
PKG	= bash
VERSION	= 5.2.15

DEBIAN	= changelog control rules

src:
	/usr/bin/apt-get source ${PKG}

deb: src
	cp ${DEBIAN} ${PKG}-${VERSION}/debian/
	cd ${PKG}-${VERSION}; \
		dch -n -p; \
		/usr/bin/debuild -i -us -uc -b
