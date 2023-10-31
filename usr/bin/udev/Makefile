# Global Makefile for udev
# $Ragnarok: Makefile,v 1.2 2023/10/31 22:49:51 lecorbeau Exp $

MAKE	= make -C
VERSION	= 254
SRC	= https://github.com/systemd/systemd/archive/v${VERSION}/systemd-${VERSION}.tar.gz
HASH	= 0d266e5361dc72097b6c18cfde1c0001

get-src:
	/usr/bin/wget -q --show-progress ${SRC}
	${TOPDIR}/usr/bin/checkhash systemd-${VERSION}.tar.gz md5 ${HASH}
	tar xzvf systemd-${VERSION}.tar.gz

all: get-src
	./do_build

install:
	# TODO: make this POSIX compliant since make doesn't do brace expansion.
	install -vm755 -d {/usr/lib,/etc}/udev/{hwdb,rules}.d
	install -vm755 -d /usr/{lib,share}/pkgconfig
	install -vm755 udevadm                     /usr/bin/
	install -vm755 systemd-hwdb                /usr/bin/udev-hwdb
	ln      -svfn  ../bin/udevadm              /usr/sbin/udevd
	cp      -av    libudev.so{,*[0-9]}         /usr/lib/
	install -vm644 ../src/libudev/libudev.h    /usr/include/
	install -vm644 src/libudev/*.pc            /usr/lib/pkgconfig/
	install -vm644 src/udev/*.pc               /usr/share/pkgconfig/
	install -vm644 ../src/udev/udev.conf       /etc/udev/
	install -vm644 rules.d/* ../rules.d/{*.rules,README} /usr/lib/udev/rules.d/
	install -vm644 hwdb.d/*  ../hwdb.d/{*.hwdb,README}   /usr/lib/udev/hwdb.d/
	install -vm755 $(find src/udev -type f | grep -F -v ".") /usr/lib/udev
