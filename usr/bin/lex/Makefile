# baseutils cat Makefile

include ${TOPDIR}/usr/share/mk/progs.mk

CC ?=		cc
CFLAGS ?=	${O_FLAG} -pipe ${HARDENING_CFLAGS}
CFLAGS +=	${OBSD_INC} -I. -DHAVE_CONFIG_H
LD_FLAGS =	${HARDENING_LDFLAGS}

LIBS =		${OBSD_LIB}

PREFIX ?=	/usr
MANDIR ?=	/usr/share/man

PROG =	lex
OBJS =	buf.o ccl.o dfa.o ecs.o filter.o gen.o main.o misc.o \
	nfa.o options.o parse.o regex.o scan.o scanflags.o \
	scanopt.o skel.o sym.o tables.o tables_shared.o \
	tblcmp.o yylex.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS} ${LIBS}

parse.h parse.c: parse.y
	/usr/bin/yacc -d parse.y
	mv y.tab.c parse.c
	mv y.tab.h parse.h

install:
	install -d -m 755 ${DESTDIR}${PREFIX}/include
	install -d -m 755 ${DESTDIR}${PREFIX}/bin ${DESTDIR}${MANDIR}/man1
	install -c -m 444 FlexLexer.h ${DESTDIR}${PREFIX}/include
	install -c -s -m 555 ${PROG} ${DESTDIR}${PREFIX}/bin/${PROG}
	install -c -s -m 555 ${PROG} ${DESTDIR}${PREFIX}/bin/flex
	install -c -s -m 555 ${PROG} ${DESTDIR}${PREFIX}/bin/flex++
	install -c -m 444 flex.1 ${DESTDIR}${MANDIR}/man1

clean:
	rm -f ${PROG} ${OBJS} parse.c parse.h
