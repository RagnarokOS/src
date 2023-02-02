
CC =		cc
CFLAGS +=	-g -O2 -I. -D_GNU_SOURCE

PROG =	ed
OBJS =	buf.o glbl.o io.o main.o re.o sub.o undo.o \
	regcomp.o regerror.o regexec.o regfree.o \
	reallocarray.o strlcat.o strlcpy.o

all: ${PROG}

${PROG}: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS}

install:
	install -d ${DESTDIR}/bin
	install -d ${DESTDIR}/usr/share/man/man1
	install -c -s -m 755 ${PROG} ${DESTDIR}/bin
	install -c -m 644 ed.1 ${DESTDIR}/usr/share/man/man1

test:
	@echo "No tests"

distclean:
	rm -f ${PROG} ${OBJS}
