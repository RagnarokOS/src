# Ragnarok Makefile for OpenBSD's apply(1)

include ../../share/mk/progs.mk

CFLAGS	=	${O_FLAG} -pipe ${HARDENING_CFLAGS} ${HARDENING_CPPFLAGS}
LDFLAGS	=	${HARDENING_LDFLAGS} -lbsd

PROG =	apply
OBJS =	apply.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS}

install:
	install -d -m 755 ${DESTDIR}/usr/bin
	install -d -m 755 ${DESTDIR}/usr/share/man/man1
	install -c -s -m 555 ${PROG} ${DESTDIR}/usr/bin/${PROG}
	install -c -m 444 ${PROG}.1 ${DESTDIR}/usr/share/man//man1

clean:
	rm -f ${PROG} ${OBJS}
