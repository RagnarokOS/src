# $Id: Makefile,v 1.2 2023/08/10 16:44:56 lecorbeau Exp $

include ../../usr/share/mk/libs.mk

CFLAGS	?= ${O_FLAG} -pipe ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
CFLAGS	+= -I.
LDFLAGS += ${HARDENING_FLAGS}

LIB	 = libopenbsd.a
OBJS	 = arc4random.o basename.o dirname.o e_atan2.o e_exp.o e_fmod.o \
	   e_log.o e_log10.o e_pow.o e_rem_pio2.o e_sqrt.o errc.o fgetln.o \
	   fmt_scaled.o fts.o getbsize.o getopt_long.o k_cos.o k_rem_pio2.o \
	   k_sin.o ldexp.o modf.o ohash.o pwd.o reallocarray.o recallocarray.o \
	   s_atan.o s_cos.o s_fabs.o s_floor.o s_scalbn.o s_sin.o setmode.o \
	   strlcat.o strlcpy.o strmode.o strtonum.o verrc.o vis.o vwarnc.o warnc.o

all: ${OBJS}
	${AR} cr ${LIB} ${OBJS}
	${RANLIB} ${LIB}

install: all
	install -d -m 755 -g 0 -o root ${DESTDIR}/lib
	install -m 755 -g 0 -o root ${LIB} ${DESTDIR}/lib

clean:
	rm -f ${LIB} ${OBJS}
