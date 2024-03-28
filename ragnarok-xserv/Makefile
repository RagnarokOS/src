# $Ragnarok: Makefile,v 1.2 2024/03/28 18:16:36 lecorbeau Exp $

PKGS	= ragnarok-xfonts ragnarok-xserv

all:
	mkdir -p ${DESTDIR}/usr/share/doc/
	cp -r usr/share/doc/ragnarok-xserv ${DESTDIR}/usr/share/doc/

deb: all
	for _pkg in ${PKGS}; do \
		equivs-build $${_pkg}.pkg; \
		done
