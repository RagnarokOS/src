# Global Makefile for diffutils
# $Ragnarok: Makefile,v 1.1 2023/12/05 16:38:46 lecorbeau Exp $

PKG	= diffutils
VERSION	= 3.8

DEBIAN	= changelog control rules

src:
	/usr/bin/apt-get source diffutils

# Building a deb package
deb: src
	cp ${DEBIAN} ${PKG}-${VERSION}/debian/
	cd ${PKG}-${VERSION}; \
		dch -n -p; \
		/usr/bin/debuild -i -us -uc -b
