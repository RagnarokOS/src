# $Id: Makefile,v 1.3 2023/08/10 16:54:06 lecorbeau Exp $

include ../../usr/share/mk/libs.mk

CFLAGS	?= ${O_FLAG} -pipe ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
CFLAGS	+= -I.
LDFLAGS += ${HARDENING_FLAGS}

LIB	 = libopenbsd.a
OBJS	 = getopt_long.o reallocarray.o recallocarray.o \
	   strlcat.o strlcpy.o

all: ${OBJS}
	${AR} cr ${LIB} ${OBJS}
	${RANLIB} ${LIB}

install: all
	install -d -m 755 -g 0 -o root ${DESTDIR}/lib
	install -m 755 -g 0 -o root ${LIB} ${DESTDIR}/lib

clean:
	rm -f ${LIB} ${OBJS}
