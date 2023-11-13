# Ragnarok-specific Makefile for coreutils
# $Ragnarok: Makefile,v 1.11 2023/11/13 19:42:56 lecorbeau Exp $

MAKE	= make -C
SRC	= https://ftp.gnu.org/gnu/coreutils/coreutils-9.3.tar.xz
VERSION	= 9.3
HASH	= 040b4b7acaf89499834bfc79609af29f

BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false ln ls \
	    mkdir mknod mv pwd readlink rm rmdir vdir sleep stty sync \
	    touch true uname mktemp

get-src:
	/usr/bin/wget -q --show-progress ${SRC}
	${TOPDIR}/usr/bin/checkhash coreutils-${VERSION}.tar.xz md5 ${HASH}
	tar xzvf coreutils-${VERSION}.tar.xz

all:
	cd coreutils-${VERSION}; \
		./configure CC=gcc \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		LDFLAGS="-Wl,-z,relro,-z,now -Wl,-zdefs" \
		YACC="/usr/bin/yacc -o y.tab.c" --prefix=/usr \
		--enable-no-install-program=kill,hostname,uptime
	${MAKE} coreutils-${VERSION}

install:
	${MAKE} coreutils-${VERSION} DESTDIR=${DESTDIR} install
	install -d ${DESTDIR}/bin
	for _prog in ${BIN_PROGS}; do \
		mv ${DESTDIR}/usr/bin/$$_prog ${DESTDIR}/bin/; \
		done
	install -d ${DESTDIR}/sbin ${DESTDIR}/usr/share/man/man8
	mv ${DESTDIR}/usr/bin/chroot ${DESTDIR}/sbin/
	sed s/\"1\"/\"8\"/1 ${DESTDIR}/usr/share/man/man1/chroot.1 \
		> ${DESTDIR}/usr/share/man/man8/chroot.8
	rm ${DESTDIR}/usr/share/man/man1/chroot.1

# When cross-compiling the toolchain.
cross:
	cd coreutils-${VERSION}; \
		./configure --prefix=/usr \
		--host=${RAGNAROK_TARGET} \
		--build=$(build-aux/config.guess) \
		--enbale-no-install-program=kill,hostname,uptime \
		gl_cv_macro_MB_CUR_MAX_good=y
	${MAKE} coreutils-${VERSION}

cross-install:
	${MAKE} coreutils-${VERSION} DESTDIR=${DESTDIR} install
	install -d ${DESTDIR}/bin
	for _prog in ${BIN_PROGS}; do \
		mv ${DESTDIR}/usr/bin/$$_prog ${DESTDIR}/bin/; \
		done
	install -d ${DESTDIR}/sbin ${DESTDIR}/usr/share/man/man8
	mv ${DESTDIR}/usr/bin/chroot ${DESTDIR}/sbin/
	sed s/\"1\"/\"8\"/1 ${DESTDIR}/usr/share/man/man1/chroot.1 \
		> ${DESTDIR}/usr/share/man/man8/chroot.8
	rm ${DESTDIR}/usr/share/man/man1/chroot.1


