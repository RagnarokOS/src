# Makefile for /usr/share/ragnarok-keys
# $Id: Makefile,v 1.1 2023/09/05 16:28:47 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/ragnarok-config.mk

KEYS	= ragnarok${VERSION}.pub ragnarok${NEXT}.pub ragnarok${VERSION}.gpg.key

all:
	@# Nothing to do here, but do something to avoid make running
	@# the 'install:' target by default.
	@echo "Nothing to make in target 'all', skipping..."

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/share/ragnarok-keys
	install -m 644 -g 0 -o root ${KEYS} ${DESTDIR}/usr/share/ragnarok-keys
