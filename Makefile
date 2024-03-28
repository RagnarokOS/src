# Global Makefile. This builds the 'ragnarok-base' and all metapackages.
# $Ragnarok: Makefile,v 1.3 2024/03/28 18:19:48 lecorbeau Exp $

MAKE		= make -C
SUBDIRS		= ragnarok-xserv

all: base metapkgs

base:
	cd ragnarok-base; \
		debuild -i -us -uc -b

metapkgs:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir deb; \
		done
