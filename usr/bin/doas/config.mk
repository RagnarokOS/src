include ../../share/mk/progs.mk

PREFIX   ?=	${PREFIX}
EPREFIX  ?=	${PREFIX}
BINDIR   ?=	/usr/bin
SHAREDIR ?=	/usr/share
MANDIR   ?=	${MANPREFIX}
SYSCONFDIR?=	/etc
PAMDIR   ?=	/etc/pam.d
PAM_DOAS =	pam.d__doas__linux
BINMODE  ?=	4755
BINOWN  ?=	root
BINGRP  ?=	root
OS_CFLAGS   +=	-D__linux__ -D_DEFAULT_SOURCE -D_GNU_SOURCE
EXTRA_CPPFLAGS	+= ${HARDENING_CPPFLAGS}
EXTRA_CFLAGS	+= ${HARDENING_CFLAGS}
EXTRA_LDFLAGS	+= ${HARDENING_LDFLAGS}
SRCS +=	libopenbsd/strlcat.c
SRCS +=	libopenbsd/strlcpy.c
SRCS +=	libopenbsd/errc.c
SRCS +=	libopenbsd/verrc.c
SRCS +=	libopenbsd/progname.c
SRCS +=	libopenbsd/readpassphrase.c
SRCS +=	libopenbsd/strtonum.c
SRCS +=	libopenbsd/closefrom.c
SRCS     +=	pam.c
LDLIBS +=	-lpam
PAM_DOAS  =	pam.d__doas__linux
