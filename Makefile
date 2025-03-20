# Global Makefile.
# $Ragnarok: Makefile,v 1.8 2025/03/20 23:32:40 lecorbeau Exp $

MAKE		= make -C
SUBDIRS		= etc usr var

## Section: create the Ragnarok-base package. See ragnarok-base.ebuild.

# Create basic directory structure
all:
	install -d ${DESTDIR}/etc
	install -d ${DESTDIR}/usr
	install -d ${DESTDIR}/var

# Target for Ragnarok-base
install: all
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done

.PHONY: all base
