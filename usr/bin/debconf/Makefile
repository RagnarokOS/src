# Global Makefile for debconf
# $Ragnarok: Makefile,v 1.1 2023/12/08 17:12:02 lecorbeau Exp $

PKG	= debconf
VERSION	= 1.5.82

DEBIAN	= changelog control
CONFIG	= config.pm

# Building a deb package
deb: src
	cp ${DEBIAN} ${PKG}-${VERSION}/debian/
	cp ${CONFIG} ${PKG}-${VERSION}/debconf/
	cd ${PKG}-${VERSION}; \
		dch -n -p; \
		/usr/bin/debuild -i -us -uc -b

src:
	/usr/bin/apt-get source debconf
