# Makefile for /etc
# $Ragnarok: Makefile,v 1.31 2024/05/29 22:52:04 lecorbeau Exp $

include ../usr/share/mk/ragnarok-config.mk

644FILES	= 01-hardening.conf 02-hardening_net.conf
INIT		= hardened_malloc rm-machineid

# Nothing to be done for 'all' target, but do something to prevent
# make from doing anything when it's being run without 'miniroot'
# or 'install' specified.
all:
	@echo "Nothing to make, skipping..."

install:
	# Create dirs that don't already exist
	install -d ${DESTDIR}/etc/dpkg
	install -d ${DESTDIR}/etc/apt/preferences.d
	install -d ${DESTDIR}/etc/apt/sources.list.d
	install -d ${DESTDIR}/etc/cron.daily
	install -d ${DESTDIR}/etc/logrotate.d
	install -d ${DESTDIR}/etc/sysctl.d
	install -d ${DESTDIR}/etc/apt/trusted.gpg.d
	install -d ${DESTDIR}/etc/default/grub.d
	install -d ${DESTDIR}/etc/dma
	install -d ${DESTDIR}/etc/init.d
	install -d ${DESTDIR}/etc/rsyslog.d
	install -d ${DESTDIR}/etc/signify
	install -d ${DESTDIR}/etc/skel
	# Install the files
	install apt/preferences.d/systemd ${DESTDIR}/etc/apt/preferences.d
	install apt/sources.list.d/llvm.sources ${DESTDIR}/etc/apt/sources.list.d
	install apt/sources.list.d/ragnarok.sources ${DESTDIR}/etc/apt/sources.list.d
	install apt/trusted.gpg.d/apt.llvm.org.asc ${DESTDIR}/etc/apt/trusted.gpg.d
	install apt/trusted.gpg.d/ragnarok01.asc ${DESTDIR}/etc/apt/trusted.gpg.d
	install cron.daily/update-manpages ${DESTDIR}/etc/cron.daily/
	install default/grub.d/01_hardening.cfg ${DESTDIR}/etc/default/grub.d/
	install default/grub ${DESTDIR}/etc/default
	install dpkg/buildflags.conf ${DESTDIR}/etc/dpkg
	install dma/dma.conf ${DESTDIR}/etc/dma
	install init.d/rm-machineid ${DESTDIR}/etc/init.d
	install logrotate.d/nftables ${DESTDIR}/etc/logrotate.d
	install rsyslog.d/nftables-log.conf ${DESTDIR}/etc/rsyslog.d
	install skel/.aliases ${DESTDIR}/etc/skel
	install signify/ragnarok${VERSION}.pub ${DESTDIR}/etc/signify
	install signify/ragnarok${NEXT}.pub ${DESTDIR}/etc/signify
	install sysctl.d/01-hardening.conf ${DESTDIR}/etc/sysctl.d
	install sysctl.d/02-hardening_net.conf ${DESTDIR}/etc/sysctl.d
