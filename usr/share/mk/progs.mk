# Compile time options used by programs in Ragnarok
# $Id: progs.mk,v 1.10 2023/12/01 16:34:17 lecorbeau Exp $

# Flags to enable ThinLTO
CFLAGS_LTO		= -flto=thin
LDFLAGS_LTO		= -flto=thin -Wl,-O2

# -D_FORTIFY_SOURCE=2 needs -O2 or higher.
O_FLAG			= -O2

# CFLAGS for control flow integrity. Depends on the LTO flags.
CFLAGS_CFI		= ${CFLAGS_LTO} -fvisibility=hidden -fsanitize=cfi

# Hardening flags
HARDENING_CPPFLAGS	= -D_FORTIFY_SOURCE=2
HARDENING_CFLAGS 	= -Wformat -Wformat-security ${CFLAGS_LTO} -fstack-clash-protection \
			  -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection
HARDENING_LDFLAGS	= ${LDFLAGS_LTO} -Wl,-z,relro,-z,now -Wl,--as-needed

# When using libopenbsd
OBSD_INC		= -I${TOPDIR}/lib/libopenbsd -include openbsd.h
OBSD_LIB		= ${TOPDIR}/lib/libopenbsd/libopenbsd.a
