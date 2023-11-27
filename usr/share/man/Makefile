# Makefile for man
# $Ragnarok: Makefile,v 1.1 2023/11/27 16:58:09 lecorbeau Exp $

SUBDIRS	= man5
MAN5	= hwclock.5

all:
	@echo "Nothing to make, skipping..."

install:
	install -d ${DESTDIR}/usr/share/man
	install -d ${SUBDIRS} ${DESTDIR}/usr/share/man
	install -m 644 -g 0 -o root ${MAN5}/usr/share/man/man5
