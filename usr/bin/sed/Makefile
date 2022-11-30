# OpenBSD sed Makefile

include ../../share/mk/progs.mk

CC ?=		cc
CFLAGS =	-O2 -pipe ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
LDFLAGS =	${HARDENING_LDFLAGS}

PROG =	sed
OBJS =	compile.o main.o misc.o process.o strlcat.o strlcpy.o strtonum.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS} ${LIBS}

install:
	install -c -s -m 555 ${PROG} ${DESTDIR}${PREFIX}/bin/${PROG}
	install -c -m 444 ${PROG}.1 ${DESTDIR}${MANPREFIX}/man1

clean:
	rm -f ${PROG} ${OBJS}
