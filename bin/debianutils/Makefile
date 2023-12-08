# Global Makefile for debianutils
# $Ragnarok: Makefile,v 1.1 2023/12/08 16:45:19 lecorbeau Exp $

PKG	= debianutils
VERSION	= 5.7

DEBIAN	= changelog control rules

# Building a deb package
deb: src
	cp ${DEBIAN} ${PKG}-${VERSION}/debian/
	cd ${PKG}-${VERSION}; \
		dch -n -p; \
		/usr/bin/debuild -i -us -uc -b

src:
	/usr/bin/apt-get source debianutils
