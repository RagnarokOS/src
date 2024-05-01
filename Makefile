# Global Makefile. This builds the 'ragnarok-base' and all metapackages.
# $Ragnarok: Makefile,v 1.4 2024/05/01 17:17:32 lecorbeau Exp $

MAKE		= make -C
SUBDIRS		= xserv

all: base metapkgs

base:
	cd base; \
		debuild -i -us -uc -b

metapkgs:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir deb; \
		done
