# Makefile for OpenBSD's rmdir
# $Ragnarok: Makefile,v 1.1 2023/11/15 17:42:49 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/progs.mk

CC ?=		cc
CFLAGS ?=	${O_FLAG} -pipe ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
CFLAGS +=	${OBSD_INC}
LDFLAGS	=	${HARDENING_LDFLAGS}

LIBS	=	${OBSD_LIB}

PROG =	rmdir
OBJS =	rmdir.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS} ${LIBS}

install:
	install -d ${DESTDIR}/bin ${DESTDIR}/usr/share/man/man1
	install -c -s -m 555 ${PROG} ${DESTDIR}/bin
	install -c -m 444 ${PROG}.1 ${DESTDIR}/usr/share/man/man1

clean:
	rm -f ${PROG} ${OBJS}
