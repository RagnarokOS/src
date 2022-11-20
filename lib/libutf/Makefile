LIBDIR = /lib

INCS= -I${DESTDIR}/usr/include -I${DESTDIR}/usr/include/base
RANLIB= ranlib

CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_FILE_OFFSET_BITS=64
CFLAGS = -std=c99 -Wall -pedantic ${INCS}

LIB = libbaseutf.a
SRC = fgetrune.c fputrune.c isalnumrune.c isalpharune.c \
	isblankrune.c iscntrlrune.c isdigitrune.c isgraphrune.c \
	isprintrune.c ispunctrune.c isspacerune.c istitlerune.c \
	isxdigitrune.c lowerrune.c rune.c runetype.c \
	upperrune.c utf.c utftorunestr.c

OBJS = ${SRC:.c=.o}

all: ${LIB}

.c.o:
	${CC} ${CFLAGS} ${CPPFLAGS} -o $@ -c $<

${LIB}: ${OBJS}
	${AR} rc $@ $?
	${RANLIB} $@

install: all
	mkdir -p -m 755 ${DESTDIR}${LIBDIR}
	install -c -o root -g root -m 644 ${LIB} ${DESTDIR}${LIBDIR}

clean: 
	rm -f ${LIB} ${OBJS}

.PHONY: all install clean
