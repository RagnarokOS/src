#!/bin/sh

# Reconfigure bc if needed.

# No need to export all individually, but it produces a prettier script.
export CC="clang"
export CPPFLAGS="-D_FORTIFY_SOURCE=2"
export CFLAGS="-O3 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection"
export LDFLAGS="-Wl,-z,relro,-z,now -Wl,-zdefs"
./configure --prefix=/usr -G -r
unset CC CPPFLAGS CFLAGS LDFLAGS
