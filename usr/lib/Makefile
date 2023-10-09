# Makefile for /usr/lib
# $Id: Makefile,v 1.4 2023/10/09 16:45:10 lecorbeau Exp $

all:
	# Nothing to do here just yet, but do something to avoid Make stopping.
	@echo "no-op yet... skipping."

miniroot:
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/lib
	install -m 644 -g 0 -o root ragnarok-shlib ${DESTDIR}/usr/lib
	install -m 644 -g 0 -o root os-release ${DESTDIR}/usr/lib
	ln -sf ${DESTDIR}/usr/lib/os-release ${DESTDIR}/etc/os-release

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/lib
	install -m 644 -g 0 -o root ragnarok-shlib ${DESTDIR}/usr/lib
	install -m 644 -g 0 -o root os-release ${DESTDIR}/usr/lib
	ln -sf ${DESTDIR}/usr/lib/os-release ${DESTDIR}/etc/os-release
	cp -r hardened_malloc ${DESTDIR}/usr/lib/
