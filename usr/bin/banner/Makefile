# Ragnarok Makefile for OpenBSD's banner(1)

include ../../share/mk/progs.mk

CFLAGS	=	-O2 -pipe ${HARDENING_CFLAGS} ${HARDENING_CPPFLAGS}
LDFLAGS	=	${HARDENING_LDFLAGS}

PROG =	banner
OBJS =	banner.o chset.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS} -lbsd

install:
	install -d -m 755 ${DESTDIR}/usr/bin
	install -d -m 755 ${DESTDIR}/usr/share/man/man1
	install -c -s -m 555 ${PROG} ${DESTDIR}/usr/bin/${PROG}
	install -c -m 444 ${PROG}.1 ${DESTDIR}/usr/share/man/man1

clean:
	rm -f ${PROG} ${OBJS}
