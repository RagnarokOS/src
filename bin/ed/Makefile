include ../../usr/share/mk/bin.mk

CC =		cc
CFLAGS =	-g -O2 -I. -D_GNU_SOURCE ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
LDFLAGS =	${HARDENING_LDFLAGS}

PROG =	ed
OBJS =	buf.o glbl.o io.o main.o re.o sub.o undo.o \
	regcomp.o regerror.o regexec.o regfree.o \
	reallocarray.o strlcat.o strlcpy.o

all: ${PROG}

${PROG}: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS}

install:
	install -d ${DESTDIR}${PREFIX}
	install -d ${DESTDIR}${MANPREFIX}/man1
	install -c -s -m 755 ${PROG} ${DESTDIR}${PREFIX}/bin
	install -c -m 644 ed.1 ${DESTDIR}${MANDIR}/man1

test:
	@echo "No tests"

clean:
	rm -f ${PROG} ${OBJS}
