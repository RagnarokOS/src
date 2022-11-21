include ../../usr/share/mk/bin.mk

CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_FILE_OFFSET_BITS=64 ${HARDENING_CPPFLAGS}
CFLAGS   = -std=c99 -Wall -pedantic ${HARDENING_CFLAGS} ${INCS}
LDFLAGS  = ${LIBINCS} -lbaseutil -s ${HARDENING_LDFLAGS}

PROG = md5sum
OBJS = md5sum.o

all: ${PROG}

${PROG}: ${OBJS}
	${CC} -o $@ ${OBJS} ${LDFLAGS}

install: all
	mkdir -p ${DESTDIR}${PREFIX}
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	install -c -m 755 ${PROG} ${DESTDIR}${PREFIX}/
	install -c -m 644 ${PROG}.1 ${DESTDIR}${MANPREFIX}/man1

clean:
	rm -f ${PROG} ${OBJS}
