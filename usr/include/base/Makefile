INCSDIR = /usr/include/base

HDR = arg.h compat.h crypt.h fs.h md5.h queue.h sha1.h sha224.h \
      sha256.h sha384.h sha512.h sha512-224.h sha512-256.h \
      text.h utf.h util.h

install: 
	mkdir -p ${DESTDIR}${INCSDIR}
	install -c -m 644 ${HDR} ${DESTDIR}${INCSDIR}/
