# Global Makefile for rsyslog
# $Ragnarok$

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
