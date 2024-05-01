# Compile time options used by libraries in Ragnarok
# $Id: libs.mk,v 1.1 2023/08/10 16:40:21 lecorbeau Exp $

# Flags to enable ThinLTO
CFLAGS_LTO		= -flto=thin
LDFLAGS_LTO		= -flto=thin -Wl,-O2

# -D_FORTIFY_SOURCE=2 needs -O2 or higher.
O_FLAG			= -O2

# Hardening flags
HARDENING_CPPFLAGS	= -D_FORTIFY_SOURCE=2
HARDENING_CFLAGS 	= -fPIC -Wformat -Wformat-security -fstack-clash-protection \
			  -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection
HARDENING_LDFLAGS	= -Wl,-z,relro,-z,now -Wl,-pie -Wl,-zdefs
