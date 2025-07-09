# Makefile to quickly install everything.
# $Ragnarok: Makefile,v 1.8 2025/07/09 16:12:35 lecorbeau Exp $

ETCDIRS		= dracut.conf.d local.d logrotate.d rsyslog.d smtpd
USEFILES	= clang llvm gcc dhcpcd cronie mandoc media noX tmux
PFILES		= package.use.mask use.force use.mask
SETSFILES	= ragnarok boot x11 xprogs virt
LOGROTATE	= logrotate.d/nftables logrotate.d/portage

## Section: create the ragnarok-base package.

# Explicitely create all dirs first.
dirs:
	for _dir in ${ETCDIRS}; do \
		install -d ${DESTDIR}/etc/$$_dir; \
		done

install: dirs
	install -m 644 nftables.rules ${DESTDIR}/etc
	install -m 644 dracut.conf.d/gentoo.conf ${DESTDIR}/etc/dracut.conf.d
	install -m 755 local.d/rm-machineid.stop ${DESTDIR}/etc/local.d
	install -m 644 ${LOGROTATE} ${DESTDIR}/etc/logrotate.d
	install -m 644 rsyslog.d/nftables.log ${DESTDIR}/etc/rsyslog.d
	install -m 644 smtpd/smtpd.conf ${DESTDIR}/etc/smtpd
