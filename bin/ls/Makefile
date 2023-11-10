# Makefile for OpenBSD's ls(1)
# $Ragnarok: Makefile,v 1.1 2023/11/10 16:54:40 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/progs.mk

CC ?=		cc
CFLAGS ?=	${O_FLAG} -pipe ${CFLAGS_LTO} ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
CFLAGS +=	${OBSD_INC}
LDFLAGS =	${LDFLAGS_LTO} ${HARDENING_LDFLAGS}

LIBS =		${OBSD_LIB}

PROG =	ls
OBJS =	cmp.o ls.o main.o print.o utf8.o util.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS} ${LIBS}

install:
	install -d ${DESTDIR}/bin ${DESTDIR}/usr/share/man/man1
	install -c -s -m 555 ${PROG} ${DESTDIR}/bin/${PROG}
	install -c -m 444 ${PROG}.1 ${DESTDIR}/usr/share/man/man1

clean:
	rm -f ${PROG} ${OBJS}
