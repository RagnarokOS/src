# $Ragnarok: Makefile,v 1.11 2023/11/12 15:21:32 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/libs.mk

CFLAGS	?= ${O_FLAG} -pipe ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
CFLAGS	+= -I.
LDFLAGS += ${HARDENING_LDFLAGS}

LIB	 = libopenbsd.a
OBJS	 = e_log.o e_log10.o errc.o fgetln.o fmt_scaled.o getbsize.o getopt_long.o \
	   reallocarray.o recallocarray.o strlcat.o strlcpy.o strtonum.o strmode.o \
	   verrc.o vwarnc.o warnc.o

all: ${OBJS}
	${AR} cr ${LIB} ${OBJS}
	ranlib ${LIB}

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/lib/libopenbsd
	install -m 755 -g 0 -o root ${LIB} ${DESTDIR}/lib/libopenbsd
	install -m 755 -g 0 -o root openbsd.h ${DESTDIR}/lib/libopenbsd

clean:
	rm -f ${LIB} ${OBJS}
