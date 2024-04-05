# $Ragnarok: Makefile,v 1.5 2024/04/05 15:52:46 lecorbeau Exp $

PKGS	= ragnarok-xfonts ragnarok-xprogs ragnarok-xserv

deb:
	for _pkg in ${PKGS}; do \
		equivs-build $${_pkg}.pkg 2>&1 | tee $$_pkg.build; \
		done
