# Makefile for /etc
# $Id: Makefile,v 1.3 2023/09/26 16:44:15 lecorbeau Exp $

644FILES = debian_version host.conf issue issue.net lsb-release motd

# Miniroot requires less stuff
miniroot:
	install -m 755 -o root -g 0 apt/preferences.d/systemd ${DESTDIR}/etc/apt/preferences.d
	install -m 755 -o root -g 0 apt/sources.list.d/ragnarok.sources ${DESTDIR}/etc/apt/sources.list.d
	install -m 644 -o root -g 0 dpkg/buildflags.conf ${DESTDIR}/etc/dpkg
	install -m 644 -o root -g 0 skel/.aliases ${DESTDIR}/etc/skel
	install -m 644 -o root -g 0 skel/.profile ${DESTDIR}/etc/skel

install:
	# Create dirs that don't already exist
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/default/grub.d
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/dpkg/origins
	install -d -m 755 -o root -g 0 ${DESTDIR}/etc/update-motd.d
	# Install the files
	install -m 755 -o root -g 0 apt/preferences.d/systemd ${DESTDIR}/etc/apt/preferences.d
	install -m 755 -o root -g 0 apt/sources.list.d/ragnarok.sources ${DESTDIR}/etc/apt/sources.list.d
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
	install -m 644 -o root -g 0 sysctl.d/01-hardening.conf ${DESTDIR}/sysctl.d
	install -m 644 -o root -g 0 sysctl.d/01-hardening_net.conf ${DESTDIR}/sysctl.d
	install -m 755 -o root -g 0 update-motd.d/10-uname ${DESTDIR}/etc/update-motd.d
	install -m 700 -o root -g 0 nftables.conf ${DESTDIR}/etc
	install -m 644 -o root -g 0 ${644FILES} ${DESTDIR}/etc
