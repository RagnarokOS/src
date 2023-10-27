# Global Makefile for rsyslog
# $Ragnarok: Makefile,v 1.1 2023/10/27 15:58:32 lecorbeau Exp $

MAKE	= make -C
VERSION = 8.2310.0

all:
	cd rsyslog-${VERSION}; \
		./configure \
		--prefix=/usr --enable-kmsg \
		--enable-libzstd --enable-libsystemd=no
	${MAKE} rsyslog-${VERSION}

install:
	${MAKE} rsyslog-${VERSION} install
