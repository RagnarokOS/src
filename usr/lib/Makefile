# Makefile for /usr/lib
# $Id: Makefile,v 1.5 2023/11/27 16:52:52 lecorbeau Exp $

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
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/lib/udev/rules.d
	install -m 644 -g 0 -o root ragnarok-shlib ${DESTDIR}/usr/lib
	install -m 644 -g 0 -o root os-release ${DESTDIR}/usr/lib
	install -m 755 -g 0 -o root udev/hwclock-set \
		${DESTDIR}/usr/lib/udev
	install -m 644 -g 0 -o root udev/rules.d/85-hwclock.rules \
		${DESTDIR}/usr/lib/udev/rules.d
	ln -sf ${DESTDIR}/usr/lib/os-release ${DESTDIR}/etc/os-release
	cp -r hardened_malloc ${DESTDIR}/usr/lib/
