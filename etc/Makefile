# Makefile for /etc
# $Ragnarok: Makefile,v 1.21 2024/02/28 19:06:48 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/ragnarok-config.mk

644FILES	= 01-hardening.conf 02-hardening_net.conf
INIT		= hardened_malloc rm-machineid

# Nothing to be done for 'all' target, but do something to prevent
# make from doing anything when it's being run without 'miniroot'
# or 'install' specified.
all:
	@echo "Nothing to make, skipping..."

# Miniroot's purpose is to provide a minimal dev environment to build
# stuff in, so not everything needs to be copied over.
miniroot:
	install -d ${DESTDIR}/etc/apt/preferences.d
	install -d ${DESTDIR}/etc/apt/sources.list.d
	install -d ${DESTDIR}/sysctl.d
	install -d ${DESTDIR}/etc/apt/trusted.gpg.d
	install -d ${DESTDIR}/etc/signify
	install -d ${DESTDIR}/etc/skel
	install apt/preferences.d/systemd ${DESTDIR}/etc/apt/preferences.d
	install apt/sources.list.d/llvm.sources ${DESTDIR}/etc/apt/sources.list.d
	install apt/trusted.gpg.d/apt.llvm.org.asc ${DESTDIR}/etc/apt/trusted.gpg.d
	install dpkg/buildflags.conf ${DESTDIR}/etc/dpkg
	install skel/.aliases ${DESTDIR}/etc/skel
	install skel/.profile ${DESTDIR}/etc/skel
	install signify/ragnarok${VERSION}.pub ${DESTDIR}/etc/signify
	install signify/ragnarok${NEXT}.pub ${DESTDIR}/etc/signify
	cd sysctl.d; \
		install ${644FILES} ${DESTDIR}/etc/sysctl.d

install:
	# Create dirs that don't already exist
	install -d ${DESTDIR}/etc/apt/preferences.d
	install -d ${DESTDIR}/etc/apt/sources.list.d
	install -d ${DESTDIR}/sysctl.d
	install -d ${DESTDIR}/etc/apt/trusted.gpg.d
	install -d ${DESTDIR}/etc/default/grub.d
	install -d ${DESTDIR}/etc/init.d
	install -d ${DESTDIR}/etc/signify
	install -d ${DESTDIR}/etc/skel
	# Install the files
	install apt/preferences.d/systemd ${DESTDIR}/etc/apt/preferences.d
	install apt/sources.list.d/llvm.sources ${DESTDIR}/etc/apt/sources.list.d
	install apt/trusted.gpg.d/apt.llvm.org.asc ${DESTDIR}/etc/apt/trusted.gpg.d
	install default/grub.d/01_hardening.cfg ${DESTDIR}/etc/default/grub.d/
	install default/grub ${DESTDIR}/etc/default
	install dpkg/buildflags.conf ${DESTDIR}/etc/dpkg
	cd init.d; \
		install ${INIT} ${DESTDIR}/etc/init.d
	install logrotate.d/nftables ${DESTDIR}/etc/logrotate.d
	install rsyslog.d/nftables ${DESTDIR}/etc/rsyslog.d
	install skel/.aliases ${DESTDIR}/etc/skel
	install skel/.profile ${DESTDIR}/etc/skel
	install signify/ragnarok${VERSION}.pub ${DESTDIR}/etc/signify
	install signify/ragnarok${NEXT}.pub ${DESTDIR}/etc/signify
	install nftables.conf.bak ${DESTDIR}/etc
	cd sysctl.d; \
		install ${644FILES} ${DESTDIR}/etc/sysctl.d
