# OpenBSD sed Makefile

include ${TOPDIR}/usr/share/mk/progs.mk

CC ?=		clang
CFLAGS =	-O2 -pipe ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS} ${OBSD_INC}
LDFLAGS =	${HARDENING_LDFLAGS}
LIBS	=	${OBSD_LIB}

PROG =	sed
OBJS =	compile.o main.o misc.o process.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS} ${LIBS}

install:
	install -d ${DESTDIR}/bin ${DESTDIR}/usr/share/man/man1
	install -c -s -m 555 ${PROG} ${DESTDIR}/bin
	install -c -m 444 ${PROG}.1 ${DESTDIR}/usr/share/man/man1

clean:
	rm -f ${PROG} ${OBJS}
