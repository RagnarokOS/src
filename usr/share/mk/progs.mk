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

INCS= -I/usr/include/ -I/usr/include/base

HARDENING_CPPFLAGS=-D_FORTIFY_SOURCE=2
HARDENING_CFLAGS=-fPIE -fPIC -Wformat-security -fstack-protector-strong --param=ssp-buffer-size=4 -fstack-clash-protection -fcf-protection
HARDENING_LDFLAGS=-Wl,-z,relro,-z,now,-z,defs -pie

PREFIX=/usr/
MANPREFIX=/usr/share/man
