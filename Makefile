# Global Makefile.
# $Ragnarok: Makefile,v 1.7 2025/03/20 15:30:37 lecorbeau Exp $

# Ragnarok release version
VERSION		= 02

# The Gentoo tarball used as a base
TARBALL		= 

# We *HAVE* to use a moint point. Before creating the stage 4 tarball,
# the filesystem needs to be unmounted then remounted read-only. This
# is the safest way.
MOUNTPOINT	= /mnt/ragnarok

MAKE		= make -C
SUBDIRS		= etc usr var

## Section: create miniroot

# Ragnarok is a custom Gentoo stage 4 archive, so start from stage 3.
# TODO: lots of stuff, but especially, don't forget to cleanup before
# creating stage 4.
miniroot:
	tar xpvf ${TARBALL} --xattrs-include='*.*' --numeric-owner -C ${MOUNTPOINT}
	for _dir in ${SUBDIRS}; do \
		DESTDIR=${MOUNTPOINT} ${MAKE} $$_dir miniroot; \
		done

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
