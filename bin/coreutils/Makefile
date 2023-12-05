# Ragnarok-specific Makefile for coreutils
# $Ragnarok: Makefile,v 1.17 2023/12/05 16:21:01 lecorbeau Exp $

MAKE	= make -C
PKG	= coreutils
VERSION	= 9.1

BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false ln ls \
	    mkdir mknod mv rm rmdir pwd readlink vdir sleep stty sync \
	    touch true uname mktemp
FILES	= AUTHORS NEWS README THANKS TODO

DEBIAN	= changelog control rules

#
# If we're not building a deb package
#
all: src
	cd coreutils-${VERSION}; \
		./configure CC=gcc \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		LDFLAGS="-Wl,-z,relro,-z,now -Wl,-zdefs" \
		YACC="/usr/bin/yacc -o y.tab.c" --prefix=/usr \
		--enable-no-install-program=kill,hostname,uptime,who
	${MAKE} coreutils-${VERSION}

src:
	/usr/bin/apt-get source coreutils

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
	ln -sf /usr/bin/md5sum \
		${DESTDIR}/usr/bin/md5sum.textutils
	ln -sf /usr/share/man/man1/md5sum.1 \
		${DESTDIR}/usr/share/man/man1/md5sum.textutils.1
	ln -sf test.1 ${DESTDIR}/usr/share/man/man1/[.1
	rm -f ${DESTDIR}/usr/share/info/dir
	install -d ${DESTDIR}/usr/share/doc/coreutils
	cd coreutils-${VERSION}; \
		install -m 644 ${FILES} ${DESTDIR}/usr/share/doc/coreutils

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

# Building a deb package
deb: src
	cp ${DEBIAN} ${PKG}-${VERSION}/debian/
	patch -d ${PKG}-${VERSION} < patches/libstdbuf-fortify-source-FIX.diff
	cd ${PKG}-${VERSION}; \
		dch -n -p; \
		/usr/bin/debuild -i -us -uc -b
