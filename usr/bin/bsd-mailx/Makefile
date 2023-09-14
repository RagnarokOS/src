#	$OpenBSD: Makefile,v 1.13 2020/12/15 00:50:01 daniel Exp $

include ${TOPDIR}/usr/share/mk/progs.mk

PROG=	mail
CC ?=	clang

CFLAGS += -D_DEFAULT_SOURCE -D_BSD_SOURCE -DDEBIAN -g -Wall ${O_FLAG} ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS} -fPIC
LDFLAGS += ${HARDENING_LDFLAGS}

SRCS=	version.c cmd1.c cmd2.c cmd3.c cmdtab.c collect.c \
	edit.c fio.c head.c v7.local.c lex.c list.c main.c names.c \
	popen.c quit.c send.c strings.c temp.c tty.c util.c vars.c


OBJS=$(SRCS:%.c=%.o)
LIBS=-llockfile -lbsd

SFILES=	mail.help mail.tildehelp
EFILES=	mail.rc
LINKS=	${BINDIR}/mail ${BINDIR}/Mail ${BINDIR}/mail ${BINDIR}/mailx
MFILES=	mail.1

all: $(PROG)

distribution:
	cd ${.CURDIR}/misc; ${INSTALL} ${INSTALL_COPY} -o root -g wheel \
	    -m 644 ${EFILES} ${DESTDIR}/etc
	cd ${.CURDIR}/misc; ${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} \
	    -m 444 ${SFILES} ${DESTDIR}/usr/share/misc


$(PROG): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

.y.c:
	bison $<
	mv -f $*.tab.c $@

clean:
	rm -f $(PROG) $(OBJS) *~ core

install:
	install -d -m 755 ${DESTDIR}/usr/bin
	install -d -m 755 ${DESTDIR}/usr/share/man/man1
	install -d -m 755 ${DESTDIR}/etc
	install -d -m 755 ${DESTDIR}/usr/share/bsd-mailx
	install -p -c -m 755 $(PROG) $(DESTDIR)/usr/bin/bsd-mailx
	install -p -c -m 644 $(MFILES) $(DESTDIR)/usr/share/man/man1/bsd-mailx.1
	cd misc && install -p -c -m 644 $(EFILES) $(DESTDIR)/etc/
	cd misc && install -p -c -m 644 $(SFILES) $(DESTDIR)/usr/share/bsd-mailx/
