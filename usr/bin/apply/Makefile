# Ragnarok Makefile for OpenBSD's apply(1)

include ${TOPDIR}/usr/share/mk/progs.mk

CFLAGS	=	${O_FLAG} -pipe ${HARDENING_CFLAGS} ${HARDENING_CPPFLAGS} ${OBSD_INC}
LDFLAGS	=	${HARDENING_LDFLAGS}
LIBS	=	${OBSD_LIB}

PROG =	apply
OBJS =	apply.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS} ${LIBS}

install:
	install -d -m 755 ${DESTDIR}/usr/bin
	install -d -m 755 ${DESTDIR}/usr/share/man/man1
	install -c -s -m 555 ${PROG} ${DESTDIR}/usr/bin/${PROG}
	install -c -m 444 ${PROG}.1 ${DESTDIR}/usr/share/man//man1

clean:
	rm -f ${PROG} ${OBJS}
