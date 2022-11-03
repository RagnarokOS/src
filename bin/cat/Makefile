# Ragnarok Makefile for OpenBSD's cat(1)

include ../../usr/share/mk/bin.mk

CFLAGS	=	-O2 -pipe ${HARDENING_CFLAGS} ${HARDENING_CPPFLAGS}
LDFLAGS	=	${HARDENING_LDFLAGS} -lbsd

PROG =	cat
OBJS =	cat.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS}

install:
	install -d -m 755 ${DESTDIR}${BINDIR}
	install -d -m 755 ${DESTDIR}${MANPREFIX}/man1
	install -c -s -m 555 ${PROG} ${DESTDIR}${BINDIR}/${PROG}
	install -c -m 444 ${PROG}.1 ${DESTDIR}${MANPREFIX}/man1

clean:
	rm -f ${PROG} ${OBJS}
