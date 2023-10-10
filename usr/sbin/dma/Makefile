# Ragnarok's Makefile for dma (Dragonfly Mail Agent)
# $Ragnarok: Makefile,v 1.1 2023/10/10 18:26:22 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/progs.mk

SH?=		sh

version=	$(shell ${SH} get-version.sh)
debversion=	$(shell ${SH} get-version.sh | sed -Ee 's/^v//;s/[.]([[:digit:]]+)[.](g[[:xdigit:]]+)$$/+\1+\2/')

CFLAGS?=	${O_FLAG} -pipe
LDADD?=		-lssl -lcrypto -lresolv

CFLAGS+=	-Wall -Wno-format-truncation -DDMA_VERSION='"${version}"' -DLIBEXEC_PATH='"${LIBEXEC}"' -DCONF_PATH='"${CONFDIR}"' \
		${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
LDFLAGS+=	${HARDENING_LDFLAGS}

INSTALL?=	install -p
CHGRP?=		chgrp
CHMOD?=		chmod

PREFIX?=	/usr
BIN?=		${PREFIX}/bin
SBIN?=		${PREFIX}/sbin
LIBEXEC?=	${PREFIX}/lib/dma
CONFDIR?=	/etc/dma
MAN?=		${PREFIX}/share/man
VAR?=		/var
DMASPOOL?=	${VAR}/spool/dma
VARMAIL?=	${VAR}/mail
SYMLINK?=	-sf # or empty to create hard link

YACC?=		yacc
LEX?=		lex
LN?=		ln

OBJS=	aliases_parse.o aliases_scan.o base64.o conf.o crypto.o
OBJS+=	dma.o dns.o local.o mail.o net.o spool.o util.o
OBJS+=	dfcompat.o

all: dma dma-mbox-create

clean:
	-rm -f .depend dma dma-mbox-create *.[do]
	-rm -f aliases_parse.[ch] aliases_scan.c

install-dma: all
	${INSTALL} -d ${DESTDIR}${SBIN}
	${INSTALL} -d ${DESTDIR}${MAN}/man8 ${DESTDIR}${LIBEXEC}
	${INSTALL} -m 2755 -o root -g mail dma ${DESTDIR}${SBIN}
	${INSTALL} -m 4754 -o root -g mail dma-mbox-create ${DESTDIR}${LIBEXEC}
	${INSTALL} -m 0644 dma.8 ${DESTDIR}${MAN}/man8/

sendmail-link:
	cd ${DESTDIR}${SBIN} && ${LN} ${SYMLINK} dma sendmail
	cd ${DESTDIR}${PREFIX}/lib && ${LN} ${SYMLINK} ../sbin/dma sendmail

mailq-link:
	cd ${DESTDIR}${SBIN} && ${LN} ${SYMLINK} dma mailq

install-spool-dirs:
	${INSTALL} -d -m 2775 -o root -g mail ${DESTDIR}${DMASPOOL}
	${INSTALL} -d -m 2775 -o root -g mail ${DESTDIR}${VARMAIL}

permissions:
	-${CHGRP} mail ${DESTDIR}${VARMAIL}/*
	-${CHMOD} g+w ${DESTDIR}${VARMAIL}/*
	-${CHMOD} 660 ${DESTDIR}${DMASPOOL}/flush

install-etc:
	${INSTALL} -d ${DESTDIR}${CONFDIR}
	@if [ -e ${DESTDIR}${CONFDIR}/dma.conf ]; then \
		echo "Not overwriting ${DESTDIR}${CONFDIR}/dma.conf."; \
	else \
		echo ${INSTALL} -m 644 -o root -g mail dma.conf ${DESTDIR}${CONFDIR}; \
		${INSTALL} -m 644 -o root -g mail dma.conf ${DESTDIR}${CONFDIR}; \
	fi
	@if [ -e ${DESTDIR}${CONFDIR}/auth.conf ]; then \
		echo "Not overwriting ${DESTDIR}${CONFDIR}/auth.conf."; \
	else \
		echo ${INSTALL} -m 640 -o root -g mail auth.conf ${DESTDIR}${CONFDIR}; \
		${INSTALL} -m 640 -o root -g mail auth.conf ${DESTDIR}${CONFDIR}; \
	fi

install: install-dma sendmail-link mailq-link install-spool-dirs install-etc
	${INSTALL} -d ${DESTDIR}${BIN}
	${INSTALL} -d ${DESTDIR}/etc/cron.d
	${INSTALL} -m 644 -g 0 -o root dma.cron.d ${DESTDIR}/etc/cron.d/dma
	cd ${DESTDIR}${BIN} && ${LN} ${SYMLINK} ../sbin/dma mailq
	cd ${DESTDIR}${BIN} && ${LN} ${SYMLINK} ../sbin/dma newaliases
	cd ${DESTDIR}${MAN}/man8 && ${LN} ${SYMLINK} dma.8 mailq.8
	cd ${DESTDIR}${MAN}/man8 && ${LN} ${SYMLINK} dma.8 newaliases.8
	cd ${DESTDIR}${MAN}/man8 && ${LN} ${SYMLINK} dma.8 sendmail.8

aliases_parse.c: aliases_parse.y
	${YACC} -d -o aliases_parse.c aliases_parse.y

aliases_scan.c: aliases_scan.l
	${LEX} -t aliases_scan.l > aliases_scan.c

.SUFFIXES: .c .o

.c.o:
	${CC} ${CFLAGS} ${CPPFLAGS} -include dfcompat.h -o $@ -c $<

dma: ${OBJS}
	${CC} ${LDFLAGS} -o $@ ${OBJS} ${LDADD}


dch:
	dch --release-heuristic changelog -v ${debversion}


ppa:
	@if [ -z '${DEB_DIST}' ]; then echo "please set DEB_DIST to build"; exit 1; fi
	dch -v "${debversion}~${DEB_DIST}" -D ${DEB_DIST} "${DEB_DIST} build" -b
	debuild -S -sa
	ver=$$(dpkg-parsechangelog -n1 | awk '$$1 == "Version:" { print $$2 }'); \
	dput ppa:corecode/dma ../dma_$${ver}_source.changes
