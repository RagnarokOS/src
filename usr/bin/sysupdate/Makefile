# $Ragnarok: Makefile,v 1.5 2024/02/19 17:38:04 lecorbeau Exp $

PROG	= sysupdate sysupgrade

all:
	@echo "Nothing to do for target 'all', skipping..."

install:
	install -d ${DESTDIR}/usr/bin
	install -d ${DESTDIR}/etc
	install -d ${DESTDIR}/usr/share/man/man5
	install -d ${DESTDIR}/usr/share/man/man8
	install ${PROG} ${DESTDIR}/usr/bin
	install sysupdate.conf ${DESTDIR}/etc
	install sysupdate.conf.5 ${DESTDIR}/usr/share/man/man5
	install ${PROG}.8 ${DESTDIR}/usr/share/man/man8
