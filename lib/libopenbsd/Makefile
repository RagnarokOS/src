# $Id: Makefile,v 1.9 2023/10/08 19:21:57 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/libs.mk

CFLAGS	?= ${O_FLAG} -pipe ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
CFLAGS	+= -I.
LDFLAGS += ${HARDENING_LDFLAGS}

LIB	 = libopenbsd.a
OBJS	 = fgetln.o getopt_long.o reallocarray.o recallocarray.o \
	   strlcat.o strlcpy.o strtonum.o

all: ${OBJS}
	${AR} cr ${LIB} ${OBJS}
	ranlib ${LIB}

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/lib/libopenbsd
	install -m 755 -g 0 -o root ${LIB} ${DESTDIR}/lib/libopenbsd
	install -m 755 -g 0 -o root openbsd.h ${DESTDIR}/lib/libopenbsd

clean:
	rm -f ${LIB} ${OBJS}
