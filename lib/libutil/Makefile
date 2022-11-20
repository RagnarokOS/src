LIBDIR = /lib

INCS = -I../../usr/include -I../../usr/include/base
RANLIB = ranlib

CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_FILE_OFFSET_BITS=64
CFLAGS = -std=c99 -Wall -pedantic ${INCS}

LIB = libbaseutil.a
SRC = concat.c cp.c crypt.c ealloc.c enmasse.c eprintf.c \
	eregcomp.c estrtod.c fnck.c fshut.c  getlines.c \
	human.c linecmp.c md5.c memmem.c mkdirp.c mode.c \
	parseoffset.c putword.c reallocarray.c recurse.c \
	rm.c sha1.c sha224.c sha256.c sha384.c sha512.c \
	sha512-224.c sha512-256.c strcasestr.c strlcat.c \
	strlcpy.c strsep.c strtonum.c unescape.c writeall.c

OBJS = $(SRC:.c=.o)

all: ${LIB}

.c.o:
	${CC} ${CFLAGS} ${CPPFLAGS} -o $@ -c $<

${LIB}: ${OBJS}
	${AR} rc $@ $?
	${RANLIB} $@

install: all
	mkdir -p ${DESTDIR}${LIBDIR}
	cp -f ${LIB} ${DESTDIR}${LIBDIR}/

clean: 
	rm -f ${LIB} ${OBJS}

.PHONY: all install clean
