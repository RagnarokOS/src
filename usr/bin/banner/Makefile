# Ragnarok Makefile for OpenBSD's banner(1)

include ../../share/mk/progs.mk

CFLAGS	=	-O2 -pipe ${HARDENING_CFLAGS} ${HARDENING_CPPFLAGS}
LDFLAGS	=	${HARDENING_LDFLAGS} -lbsd

PROG =	banner
OBJS =	banner.o chset.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS}

install:
	install -d -m 755 ${DESTDIR}${PREFIX}/bin
	install -d -m 755 ${DESTDIR}${MANPREFIX}/man1
	install -c -s -m 555 ${PROG} ${DESTDIR}${PREFIX}/bin/${PROG}
	install -c -m 444 ${PROG}.1 ${DESTDIR}${MANPREFIX}/man1

clean:
	rm -f ${PROG} ${OBJS}
