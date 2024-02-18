# $Ragnarok: Makefile,v 1.4 2024/02/18 16:20:25 lecorbeau Exp $

PROG	= sysupdate sysupgrade
CONF	= ${PROG}.conf

all:
	@echo "Nothing to do for target 'all', skipping..."

install:
	install -d ${DESTDIR}/usr/bin
	install -d ${DESTDIR}/etc
	install -d ${DESTDIR}/usr/share/man/man5
	install -d ${DESTDIR}/usr/share/man/man8
	install ${PROG} ${DESTDIR}/usr/bin
	install ${CONF} ${DESTDIR}/etc
	install ${CONF}.5 ${DESTDIR}/usr/share/man/man5
	install ${PROG}.8 ${DESTDIR}/usr/share/man/man8
