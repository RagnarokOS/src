# Compile time options used by programs in Ragnarok
# $Id: progs.mk,v 1.1 2023/07/31 23:23:10 lecorbeau Exp $

# Hardening flags
HARDENING_CPPFLAGS	= -D_FORTIFY_SOURCE=2
HARDENING_CFLAGS 	= -O2 -fPIE -Wformat -Wformat-security -fstack-protector-strong \
			  -fstack-clash-protection --param=ssp-buffer-size=4 -fcf-protection=full
HARDENING_LDFLAGS	= -Wl,-z,relro,-z,now -Wl,-pie -Wl,-zdefs
