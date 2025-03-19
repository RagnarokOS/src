# Makefile for usr dir

all:
	@echo "Nothing to do for 'all', skipping..."

install:
	install -d ${DESTDIR}/usr/share/openpgp-keys
	install -d ${DESTDIR}/usr/src
	install -m 644 share/openpgp-keys/lecorbeau.asc \
		${DESTDIR}/usr/share/openpgp-keys
	install -m 644 src/ragnarok.config \
		${DESTDIR}/usr/src
