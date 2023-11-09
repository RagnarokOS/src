# Ragnarok Makefile for OpenBSD's cat(1)

include ${TOPDIR}/usr/share/mk/progs.mk

CFLAGS	=	-O2 -pipe ${HARDENING_CFLAGS} ${HARDENING_CPPFLAGS}
LDFLAGS	=	${HARDENING_LDFLAGS} -lbsd

PROG =	cat
OBJS =	cat.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS}

install:
	install -d -m 755 ${DESTDIR}/bin
	install -d -m 755 ${DESTDIR}/usr/share/man/man1
	install -c -s -m 555 ${PROG} ${DESTDIR}/bin/${PROG}
	install -c -m 444 ${PROG}.1 ${DESTDIR}/usr/share/man/man1

clean:
	rm -f ${PROG} ${OBJS}
