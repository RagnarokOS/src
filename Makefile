# Global Makefile. This builds the 'ragnarok-base' and all metapackages.
# $Ragnarok: Makefile,v 1.1 2024/03/28 15:26:16 lecorbeau Exp $

MAKE		= make -C
METAPKGS	= ragnarok-xfonts ragnarok-xserv

all: base metapkgs

base:
	cd ragnarok-base; \
		debuild -i -us -uc -b

metapkgs:
	for _dir in ${METAPKGS}; do \
		${MAKE} $$_dir pkgs; \
		done
