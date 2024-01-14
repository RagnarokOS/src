# Global Makefile for flex
# $Ragnarok: Makefile,v 1.5 2024/01/14 18:32:16 lecorbeau Exp $

PKG	= flex
VERSION	= 2.6.4

DEBIAN	= changelog control rules

# Building a deb package
deb: src
	cp ${DEBIAN} ${PKG}-${VERSION}/debian/
	cd ${PKG}-${VERSION}; \
		dch -n -p; \
		/usr/bin/debuild -i -us -uc -b

src:
	/usr/bin/apt-get source ${PKG}
