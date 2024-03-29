# $Ragnarok: Makefile,v 1.4 2024/03/29 17:45:14 lecorbeau Exp $

PKGS	= ragnarok-xfonts ragnarok-xprogs ragnarok-xserv

deb:
	for _pkg in ${PKGS}; do \
		equivs-build $${_pkg}.pkg; \
		done
