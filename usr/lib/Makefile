# Makefile for /usr/lib
# $Id: Makefile,v 1.6 2023/12/23 15:22:49 lecorbeau Exp $

all:
	# Nothing to do here just yet, but do something to avoid Make stopping.
	@echo "no-op yet... skipping."

miniroot:
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/lib
	install -m 644 -g 0 -o root ragnarok-shlib ${DESTDIR}/usr/lib

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/lib
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/lib/udev/rules.d
	install -m 644 -g 0 -o root ragnarok-shlib ${DESTDIR}/usr/lib
	install -m 755 -g 0 -o root udev/hwclock-set \
		${DESTDIR}/usr/lib/udev
	install -m 644 -g 0 -o root udev/rules.d/85-hwclock.rules \
		${DESTDIR}/usr/lib/udev/rules.d
	cp -r hardened_malloc ${DESTDIR}/usr/lib/
