# $Ragnarok: Makefile,v 1.13 2023/11/15 17:37:07 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/libs.mk

CFLAGS	?= ${O_FLAG} -pipe ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
CFLAGS	+= -I.
LDFLAGS += ${HARDENING_LDFLAGS}

LIB	 = libopenbsd.a
OBJS	 = e_log.o e_log10.o e_pow.o e_sqrt.o errc.o fgetln.o fmt_scaled.o getbsize.o \
	   getopt_long.o ldexp.o ohash.o pwd.o reallocarray.o recallocarray.o s_fabs.o \
	   s_scalbn.o strlcat.o strlcpy.o strtonum.o strmode.o verrc.o vwarnc.o warnc.o
HEADERS	= math_private.h ohash.h openbsd.h

all: ${OBJS}
	${AR} cr ${LIB} ${OBJS}
	ranlib ${LIB}

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/lib/libopenbsd
	install -m 755 -g 0 -o root ${LIB} ${DESTDIR}/lib/libopenbsd
	install -m 755 -g 0 -o root ${HEADERS} ${DESTDIR}/lib/libopenbsd

clean:
	rm -f ${LIB} ${OBJS}
