# Global Makefile for debconf
# $Ragnarok: Makefile,v 1.2 2023/12/08 19:20:04 lecorbeau Exp $

PKG	= debconf
VERSION	= 1.5.82

DEBIAN	= changelog control
CONFIG	= Config.pm

# Building a deb package
deb: src
	cp ${DEBIAN} ${PKG}-${VERSION}/debian/
	cp ${CONFIG} ${PKG}-${VERSION}/Debconf/
	cd ${PKG}-${VERSION}; \
		dch -n -p; \
		/usr/bin/debuild -i -us -uc -b

src:
	/usr/bin/apt-get source debconf
