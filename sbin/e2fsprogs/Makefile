# Global Makefile for e2fsprogs
# $Ragnarok: Makefile,v 1.2 2023/10/30 18:22:19 lecorbeau Exp $

MAKE	= make -C
VERSION	= 1.47.0

all:
	cd e2fsprogs-${VERSION}; \
		./configure CC=clang \
		CFLAGS="-g -O2 -fstack-clash-protection -fstack-protector-strong --param=ssp-buffer-size=4 -fcf-protection" \
		CPPFLAGS="-D_FORTIFY_SOURCE=2" \
		LDFLAGS="-Wl,-z,relro,-z,now -Wl,-zdefs" \
		--enable-elf-shlibs --disable-e2initrd-helper \
		--disable-fsck --disable-libblkid --disable-libuuid \
		--disable-fuse2fs --infodir=/usr/share/info \
		--sysconfdir=/etc
	${MAKE} e2fsprogs-${VERSION}

install:
	${MAKE} e2fsprogs-${VERSION} DESTDIR=${DESTDIR} install
	gunzip ${DESTDIR}/usr/share/info/libext2fs.info.gz
	install-info --dir-file=${DESTDIR}/usr/share/info/dir ${DESTDIR}/usr/share/info/libext2fs.info
