# Makefile for OpenBSD's m4
# $Ragnarok: Makefile,v 1.1 2023/11/13 20:53:18 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/progs.mk

CC ?=		cc
CFLAGS ?=	${O_FLAG} -pipe ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
CFLAGS +=	${OBSD_INC} -DEXTENDED -I.
LDFLAGS =	${HARDENING_LDFLAGS}

YACC =	yacc

LIBS =	${OBSD_LIB}

PROG =	m4
OBJS =	eval.o expr.o look.o main.o misc.o gnum4.o parser.o trace.o tokenizer.o

all: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS} ${LIBS}

parser.h parser.c: parser.y
	yacc -d parser.y
	mv y.tab.c parser.c
	mv y.tab.h parser.h

install:
	install -d ${DESTDIR}/usr/bin ${DESTDIR}/usr/share/man/man1
	install -c -s -m 555 ${PROG} ${DESTDIR}/usr/bin
	install -c -m 444 ${PROG}.1 ${DESTDIR}/usr/share/man/man1

clean:
	rm -f ${PROG} ${OBJS} parser.c parser.h
