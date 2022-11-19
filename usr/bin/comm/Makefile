include ../../share/mk/progs.mk

CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_FILE_OFFSET_BITS=64 ${HARDENING_CPPFLAGS}
CFLAGS   = -std=c99 -Wall -pedantic ${HARDENING_CFLAGS} ${INCS}
LDFLAGS  = ${HARDENING_LDFLAGS} -lbaseutil -s

PROG = comm
OBJS = comm.o

all: ${PROG}

${PROG}: ${OBJS}
	${CC} ${OBJS} ${LDFLAGS} -o ${PROG}

install: all
	mkdir -p ${DESTDIR}${PREFIX}
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	cp -f ${PROG} ${DESTDIR}${PREFIX}/
	cp -f ${PROG}.1 ${DESTDIR}${MANPREFIX}/man1/

clean:
	rm -f ${PROG} ${OBJS}
