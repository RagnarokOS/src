# Ragnarok's Makefile for hostname(1)
# $Ragnarok: Makefile,v 1.1 2023/11/25 16:50:19 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/progs.mk

CPPFLAGS	= -D_GNU_SOURCE -Wdate-time ${HARDENING_CPPFLAGS}
CFLAGS		= ${O_FLAG} -Wall ${CPPFLAGS} ${HARDENING_CFLAGS}
LDFLAGS		= ${HARDENING_LDFLAGS}

BINDIR		= /bin
MANDIR		= /usr/share/man

OBJS		= hostname.o

hostname: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)

install: hostname
	install -d ${DESTDIR}/${BINDIR}
	install -d ${DESTDIR}/${MANDIR}/man1
	install -o root -g 0 -m 0644 hostname.1 ${DESTDIR}/${MANDIR}/man1
	cd ${DESTDIR}/${MANDIR}/man1; \
		ln -fs hostname.1 dnsdomainname.1; \
		ln -fs hostname.1 domainname.1; \
		ln -fs hostname.1 ypdomainname.1; \
		ln -fs hostname.1 nisdomainname.1
	install -o root -g 0 -m 0755 hostname ${DESTDIR}${BINDIR}
	cd ${DESTDIR}/${BINDIR}; \
		ln -fs hostname dnsdomainname; \
		ln -fs hostname domainname; \
		ln -fs hostname nisdomainname; \
		ln -fs hostname ypdomainname

clean:
	-rm -f $(OBJS) hostname dnsdomainname domainname nisdomainname ypdomainname

.PHONY: clean install
