# Makefile for /etc
# Ragnarok: Makefile,v 1.4 2023/09/28 15:15:10 lecorbeau Exp i $

include ${TOPDIR}/usr/share/mk/ragnarok-config.mk

644FILES	= debian_version host.conf issue issue.net lsb-release motd sysctl.conf

# Nothing to be done for 'all' target, but do something to prevent
# make from doing anything when it's being run without 'miniroot'
# or 'install' specified.
all:
	@echo "Nothing to make, skipping..."

# Miniroot's purpose is to provide a minimal dev environment to build
# stuff in, so not everything needs to be copied over.
miniroot:
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/apt/preferences.d
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/apt/sources.list.d
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/apt/trusted.gpg.d
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/dpkg/origins
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/signify
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/skel
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/update-motd.d
	install -m 644 -o root -g 0 apt/preferences.d/systemd ${DESTDIR}/etc/apt/preferences.d
	install -m 644 -o root -g 0 apt/sources.list.d/llvm.sources ${DESTDIR}/etc/apt/sources.list.d
	install -m 644 -o root -g 0 apt/trusted.gpg.d/apt.llvm.org.asc ${DESTDIR}/etc/apt/trusted.gpg.d
	install -m 644 -o root -g 0 dpkg/buildflags.conf ${DESTDIR}/etc/dpkg
	install -m 644 -o root -g 0 dpkg/origins/debian ${DESTDIR}/etc/dpkg/origins
	install -m 644 -o root -g 0 dpkg/origins/ragnarok ${DESTDIR}/etc/dpkg/origins
	ln -sf ${DESTDIR}/etc/dpkg/origins/ragnarok ${DESTDIR}/etc/dpkg/origins/default
	install -m 644 -o root -g 0 skel/.aliases ${DESTDIR}/etc/skel
	install -m 644 -o root -g 0 skel/.profile ${DESTDIR}/etc/skel
	install -m 644 -o root -g 0 signify/ragnarok${VERSION}.pub ${DESTDIR}/etc/signify
	install -m 644 -o root -g 0 signify/ragnarok${NEXT}.pub ${DESTDIR}/etc/signify
	install -m 755 -o root -g 0 update-motd.d/10-uname ${DESTDIR}/etc/update-motd.d
	install -m 644 -o root -g 0 ${644FILES} ${DESTDIR}/etc

install:
	# Create dirs that don't already exist
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/apt/preferences.d
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/apt/sources.list.d
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/trusted.gpg.d
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/default/grub.d
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/dpkg/origins
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/signify
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/skel
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/update-motd.d
	# Install the files
	install -m 644 -o root -g 0 apt/preferences.d/systemd ${DESTDIR}/etc/apt/preferences.d
	install -m 644 -o root -g 0 apt/sources.list.d/llvm.sources ${DESTDIR}/etc/apt/sources.list.d
	install -m 644 -o root -g 0 apt/trusted.gpg.d/apt.llvm.org.asc ${DESTDIR}/etc/apt/trusted.gpg.d
	install -m 600 -o root -g 0 default/grub.d/01_hardening.cfg ${DESTDIR}/etc/default/grub.d/
	install -m 644 -o root -g 0 default/grub ${DESTDIR}/etc/default
	install -m 644 -o root -g 0 dpkg/buildflags.conf ${DESTDIR}/etc/dpkg
	install -m 644 -o root -g 0 dpkg/origins/debian ${DESTDIR}/etc/dpkg/origins
	install -m 644 -o root -g 0 dpkg/origins/ragnarok ${DESTDIR}/etc/dpkg/origins
	ln -sf ${DESTDIR}/etc/dpkg/origins/ragnarok ${DESTDIR}/etc/dpkg/origins/default
	install -m 644 -o root -g 0 init.d/rm-machineid ${DESTDIR}/etc/init.d
	install -m 644 -o root -g 0 logrotate.d/nftables ${DESTDIR}/etc/logrotate.d
	install -m 644 -o root -g 0 rsyslog.d/nftables ${DESTDIR}/etc/rsyslog.d
	install -m 644 -o root -g 0 skel/.aliases ${DESTDIR}/etc/skel
	install -m 644 -o root -g 0 skel/.profile ${DESTDIR}/etc/skel
	install -m 644 -o root -g 0 signify/ragnarok${VERSION}.pub ${DESTDIR}/etc/signify
	install -m 644 -o root -g 0 signify/ragnarok${NEXT}.pub ${DESTDIR}/etc/signify
	install -m 755 -o root -g 0 update-motd.d/10-uname ${DESTDIR}/etc/update-motd.d
	install -m 700 -o root -g 0 nftables.conf ${DESTDIR}/etc
	install -m 644 -o root -g 0 ${644FILES} ${DESTDIR}/etc
