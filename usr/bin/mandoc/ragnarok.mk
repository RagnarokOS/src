# Ragnarok Makefile for mandoc

include ../../share/mk/ragnarok-config.mk

UPSTREAM_VERSION = 1.14.6

all: changelog pkg clean

changelog:
	# use MESSAGE="message here" make -f ragnarok.mk
	# ditto if this is a revision: MESSAGE="message" REV="number" make -f ragnarok.mk
	dch --distribution ${CODENAME} -v ${UPSTREAM_VERSION}-${DISTRO}${VERSION}${REV} "${MESSAGE}"

pkg:
	# install build depends
	mk-build-deps --install --root-cmd doas debian/control
	# move these out of the way
	mv mandoc-build-deps_${UPSTREAM_VERSION}-${DISTRO}${VERSION}${REV}_all.deb ../../../../
	mv mandoc-build-deps_${UPSTREAM_VERSION}-${DISTRO}${VERSION}${REV}_amd64.buildinfo ../../../../
	mv mandoc-build-deps_${UPSTREAM_VERSION}-${DISTRO}${VERSION}${REV}_amd64.changes ../../../../
	# Build the package
	debuild -i -us -uc -b -rfakeroot

clean:
	#create packages dir if it doesn't exist
	mkdir -p ../../../../packages
	mv ../mandoc_${UPSTREAM_VERSION}-${DISTRO}${VERSION}${REV}_amd64.deb ../../../../packages
	rm ../mandoc-dbgsym_${UPSTREAM_VERSION}-${DISTRO}${VERSION}${REV}_amd64.deb ../../../../packages
	rm ../mandoc_${UPSTREAM_VERSION}-${DISTRO}${VERSION}${REV}_amd64.build
	rm ../mandoc_${UPSTREAM_VERSION}-${DISTRO}${VERSION}${REV}_amd64.buildinfo
	rm ../mandoc_${UPSTREAM_VERSION}-${DISTRO}${VERSION}${REV}_amd64.changes
	make distclean
	make regress-clean
	make regress-distclean
	dh_clean
