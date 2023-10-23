# Ragnarok-specific Makefile for coreutils
# $Ragnarok: Makefile,v 1.5 2023/10/23 20:17:41 lecorbeau Exp $

MAKE	= make -C
VERSION	= 9.3

BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false ln ls \
	    mkdir mknod mv pwd readlink rm rmdir vdir sleep stty sync \
	    touch true uname mktemp

all:
	cd coreutils-${VERSION}; \
		./configure CC=clang YACC="/usr/bin/yacc -o y.tab.c" --prefix=/usr \
		--enable-no-install-program=kill,hostname,uptime
	cd coreutils-${VERSION}; \
		patch -p1 Makefile < ../patches/make.diff
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


