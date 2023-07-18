include ../../share/mk/ragnarok-config.mk

PROG	= sysupdate
CONF	= ${PROG}.conf

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/var/db/updates
	install -m 755 -g 0 -o root ${PROG} ${DESTDIR}/usr/bin
	install -m 644 -g 0 -o root ${ETC}/${CONF} ${DESTDIR}/etc
	install -m 644 -g 0 -o root ${MAN}/man5/${CONF}.5 ${DESTDIR}/usr/share/man/man5
	install -m 644 -g 0 -o root ${MAN}/man8/${PROG}.8 ${DESTDIR}/usr/share/man/man8
	
# Only create dirs if we're creating a package (except /var/db/updates)
dirs:
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/bin
	install -d -m 755 -g 0 -o root ${DESTDIR}/etc
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/share/man/man5
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/share/man/man8

dist: dirs install
