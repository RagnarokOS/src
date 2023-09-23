# $Id: Makefile,v 1.7 2023/09/23 17:22:20 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/libs.mk

CFLAGS	?= ${O_FLAG} -pipe ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
CFLAGS	+= -I.
LDFLAGS += ${HARDENING_LDFLAGS}

LIB	 = libopenbsd.a
OBJS	 = getopt_long.o reallocarray.o recallocarray.o \
	   strlcat.o strlcpy.o

all: ${OBJS}
	${AR} cr ${LIB} ${OBJS}
	ranlib ${LIB}

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/lib
	install -m 755 -g 0 -o root ${LIB} ${DESTDIR}/lib

clean:
	rm -f ${LIB} ${OBJS}
