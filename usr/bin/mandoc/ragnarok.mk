# Ragnarok Makefile for mandoc

include ../../share/mk/ragnarok-config.mk

UPSTREAM_VERSION = 1.14.6

all: changelog pkg

changelog:
	# use MESSAGE="message here" make -f ragnarok.mk
	# ditto if this is a revision: MESSAGE="message" REV="number" make -f ragnarok.mk
	dch --distribution ${CODENAME} -v ${UPSTREAM_VERSION}-${DISTRO}${VERSION}${REV} "${MESSAGE}"

pkg:
	mk-build-deps --install --root-cmd doas debian/control
	debuild -i -us -uc -b -rfakeroot
