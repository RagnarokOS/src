# This Makefile automatically generated by configure.

HARDENING_CPPFLAGS+=-D_FORTIFY_SOURCE=2
HARDENING_CFLAGS=-fstack-clash-protection -fstack-protector-strong -fPIE -fPIC
HARDENING_LDFLAGS=-Wl,-z,relro,-z,now -fPIE -pie

CC =		clang
LD =		ld.lld
CFLAGS =	-g -O2 -DEMACS -DVI -w -D_GNU_SOURCE ${HARDENING_CFLAGS} ${HARDENING_CPPFLAGS}
LDFLAGS =	${HARDENING_LDFLAGS}

PREFIX =	/
BINDIR =	/bin
MANDIR =	/usr/share/man

PROG =	ksh
OBJS =	alloc.o asprintf.o c_ksh.o c_sh.o c_test.o c_ulimit.o edit.o \
	emacs.o eval.o exec.o expr.o history.o io.o jobs.o lex.o mail.o \
	main.o misc.o path.o shf.o syn.o table.o trap.o tree.o tty.o var.o \
	version.o vi.o confstr.o reallocarray.o siglist.o signame.o \
	strlcat.o strlcpy.o strtonum.o unvis.o vis.o issetugid.o

all: ${PROG}

${PROG}: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS}  -lcurses ${LIBS}

install:
	install -d ${DESTDIR}${BINDIR}
	install -d ${DESTDIR}${MANDIR}/man1
	install -c -s -m 755 ${PROG} ${DESTDIR}${BINDIR}
	install -c -m 644 ${PROG}.1 ${DESTDIR}${MANDIR}/man1
	install -d ${DESTDIR}${BINDIR}
	install -d ${DESTDIR}${MANDIR}/man1
	install -c -s -m 755 ${PROG} ${DESTDIR}${BINDIR}/sh
	install -c -m 644 sh.1 ${DESTDIR}${MANDIR}/man1
	echo "/bin/ksh" >> /etc/shells
	#echo "/bin/sh" >> /etc/shells

uninstall:
	rm -f ${DESTDIR}${BINDIR}/${PROG}
	rm -f ${DESTDIR}${MANDIR}/man1/${PROG}.1
	rm -f ${DESTDIR}${BINDIR}/sh
	rm -f ${DESTDIR}${MANDIR}/man1/sh.1

test:
	echo "No tests"

clean:
	rm -f ${PROG} ${OBJS}

distclean: clean
	rm -f Makefile pconfig.h *.core
