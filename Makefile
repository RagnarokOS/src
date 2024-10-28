# Global Makefile. This builds the 'ragnarok-base' and all metapackages.
# $Ragnarok: Makefile,v 1.5 2024/10/28 15:39:55 lecorbeau Exp $

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

.PHONY: all base metapkgs
