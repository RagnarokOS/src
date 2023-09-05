# Makefile for /usr/share/mk
# $Id: Makefile,v 1.2 2023/09/05 16:48:57 lecorbeau Exp $

FILES = libs.mk progs.mk ragnarok-config.mk

all:
	@# Nothing to do here, but do something to avoid make running
	@# the 'install:' target by default.
	@echo "Nothing to make in target 'all', skipping..."

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/share/mk
	install -m 644 -g 0 -o root ${FILES} ${DESTDIR}/usr/share/mk
