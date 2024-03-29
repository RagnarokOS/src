# $Ragnarok: Makefile,v 1.3 2024/03/29 17:30:21 lecorbeau Exp $

PKGS	= ragnarok-xfonts ragnarok-xserv

deb:
	for _pkg in ${PKGS}; do \
		equivs-build $${_pkg}.pkg; \
		done
