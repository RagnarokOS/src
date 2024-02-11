# $Id: Makefile,v 1.3 2024/02/11 16:40:28 lecorbeau Exp $

PROG	= sysupdate sysupgrade
CONF	= ${PROG}.conf

all:
	@echo "Nothing to do for target 'all', skipping..."

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/var/db/updates
	@# If creating a package from a non-Ragnarok system, the
	@# _sysupdate user might not exist, so return true if chown
	@# fails to avoid make exiting with an error.
	@# In such case, it'll be up to the package maintainer to
	@# create a post-install script to set up ownership.
	chown _sysupdate:_sysupdate ${DESTDIR}/var/db/updates || true
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/bin
	install -d -m 755 -g 0 -o root ${DESTDIR}/etc
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/share/man/man5
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/share/man/man8
	install -m 755 -g 0 -o root ${PROG} ${DESTDIR}/usr/bin
	install -m 644 -g 0 -o root ${CONF} ${DESTDIR}/etc
	install -m 644 -g 0 -o root ${CONF}.5 ${DESTDIR}/usr/share/man/man5
	install -m 644 -g 0 -o root ${PROG}.8 ${DESTDIR}/usr/share/man/man8
