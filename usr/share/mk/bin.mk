# At some point software in /bin will be statically compiled with
# -static-pie, so we need a different .mk file.

CC=clang
CXX=clang++
LD=ld.lld
AR=llvm-ar
NM=llvm-nm
RANLIB=llvm-ranlib
STRIP=llvm-strip
OBJCOPY=llvm-objcopy
OBJDUMP=llvm-objdump
STRINGS=llvm-strings
READELF=llvm-readelf
ADDR2LINE=llvm-addr2line

HARDENING_CPPFLAGS+=-D_FORTIFY_SOURCE=2
HARDENING_CFLAGS=-fstack-clash-protection -fstack-protector-strong -fPIE -fPIC
HARDENING_LDFLAGS=-Wl,-z,relro,-z,now -fPIE -pie

BINDIR=/bin
PREFIX=/usr
MANPREFIX=$(PREFIX)/share/man
