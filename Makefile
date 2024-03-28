# Global Makefile. This builds the 'ragnarok-base' and all metapackages.
# $Ragnarok: Makefile,v 1.2 2024/03/28 15:45:59 lecorbeau Exp $

MAKE		= make -C

all: base metapkgs

base:
	cd ragnarok-base; \
		debuild -i -us -uc -b

metapkgs:
	${MAKE} metapackages
