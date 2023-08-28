# Makefile for /usr/lib
# $Id: Makefile,v 1.2 2023/08/28 18:54:01 lecorbeau Exp $

all:
	# Nothing to do here just yet, but do something to avoid Make stopping.
	@echo "no-op yet... skipping."

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/lib
	install -m 644 -g 0 -o root ragnarok-shlib ${DESTDIR}/usr/lib
	cp -r hardened_malloc ${DESTDIR}/usr/lib/
