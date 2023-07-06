# Makefile for /usr

MAKE = make -C

KEYDIR = share/ragnarok-keys
KEYS = ${KEYDIR}/ragnarok01.pub ${KEYDIR}/ragnarok02.pub ${KEYDIR}/ragnarok01.gpg.key

all: install

install:
	install -d 755 -o root -g 0 ${DESTDIR}/usr/share/ragnarok-keys
	install -m 755 -o root -g 0 lib/ragnarok-shlib ${DESTDIR}/usr/lib
	install -m 755 -o root -g 0 ${KEYS} ${DESTDIR}/usr/share/ragnarok-keys
