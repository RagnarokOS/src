# Makefile for /usr/lib
# $Id: Makefile,v 1.7 2024/01/29 19:35:34 lecorbeau Exp $

all:
	# Nothing to do here just yet, but do something to avoid Make stopping.
	@echo "no-op yet... skipping."

miniroot:
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/lib
	install -m 644 -g 0 -o root ragnarok-shlib ${DESTDIR}/usr/lib

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/lib
	install -m 644 -g 0 -o root ragnarok-shlib ${DESTDIR}/usr/lib
	cp -r hardened_malloc ${DESTDIR}/usr/lib/
