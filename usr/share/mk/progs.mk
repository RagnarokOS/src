# Compile time options used by programs in Ragnarok
# $Id: progs.mk,v 1.4 2023/08/01 15:56:06 lecorbeau Exp $

# Flags to enable ThinLTO
CFLAGS_LTO		= -flto=thin
LDFLAGS_LTO		= -flto=thin -Wl,-O2

# -D_FORTIFY_SOURCE=2 needs -O2 or higher.
O_FLAG			= -O2

# Hardening flags
HARDENING_CPPFLAGS	= -D_FORTIFY_SOURCE=2
HARDENING_CFLAGS 	= ${O_FLAG} -fPIE -Wformat -Wformat-security -fstack-clash-protection \
			  -fstack-protector-strong -fcf-protection --param=ssp-buffer-size=4
HARDENING_LDFLAGS	= -Wl,-z,relro,-z,now -Wl,-pie -Wl,-zdefs
