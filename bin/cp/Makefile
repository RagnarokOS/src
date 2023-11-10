# Makefile for OpenBSD's cp(1)
# $Ragnarok: Makefile,v 1.1 2023/11/10 16:50:23 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/progs.mk

CC ?=		cc
CFLAGS ?=	-O2 -pipe ${CFLAGS_LTO} ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
CFLAGS +=	${OBSD_INC}
LDFLAGS =	${LDFLAGS_LTO} ${HARDENING_LDFLAGS}

LIBS =		${OBSD_LIB}

PROG =	cp
OBJS =	cp.o utils.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS} ${LIBS}

install:
	install -d ${DESTDIR}/bin ${DESTDIR}/usr/share/man/man1
	install -c -s -m 555 ${PROG} ${DESTDIR}/bin/${PROG}
	install -c -m 444 ${PROG}.1 ${DESTDIR}/usr/share/man/man1

clean:
	rm -f ${PROG} ${OBJS}
