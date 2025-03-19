# Makefile to quickly install everything.
# $Ragnarok: Makefile,v 1.1 2025/03/19 22:44:52 lecorbeau Exp $

ETCDIRS		= dracut.conf.d local.d logrotate.d portage rsyslog.d smtpd
PORTAGEDIRS	= env package.use profile
USEDIR		= portage/package.use
ENVFILES	= portage/env/compiler-clang portage/env/compiler-gcc \
		  portage/env/nolto
USEFILES	= clang llvm gcc dhcpcd cronie mandoc media noX tmux
PFILES		= package.use.mask use.force use.mask
LOGROTATE	= logrotate.d/nftables logrotate.d/portage

# Explicitely create all dirs first.
dirs:
	for _dir in ${ETCDIRS}; do \
		install -d ${DESTDIR}/$$_dir; \
		done
	cd portage; \
		for _dir in ${PORTAGEDIRS}; do \
			install -d ${DESTDIR}/$$_dir; \
			done
	install -d ${DESTDIR}/etc/${USEDIR}
	install -d ${DESTDIR}/etc/portage/profile/package.use.force

install: dirs
	install -m 644 nftables.rules ${DESTDIR}/etc
	install -m 644 dracut.conf.d/gentoo.conf ${DESTDIR}/etc/dracut.conf.d
	install -m 755 local.d/rm-machineid.stop ${DESTDIR}/etc/local.d
	install -m 644 ${LOGROTATE} ${DESTDIR}/etc/logrotate.d
	install -m 644 rsyslog.d/nftables.log ${DESTDIR}/rsyslog.d
	install -m 644 smtpd/smtpd.conf ${DESTDIR}/smtpd
	install -m 644 make.conf ${DESTDIR}/etc/portage
	install -m 644 package.env ${DESTDIR}/etc/portage
	install -m 644 package.license ${DESTDIR}/etc/portage
	install -m 644 ${ENVFILES} ${DESTDIR}/etc/portage/env
	cd ${USEDIR}; \
		install -m 644 ${USEFILES} ${DESTDIR}/etc/portage/${USEDIR}
	install -m 644 etc/portage/profile/package.use.force/clang \
		${DESTDIR}/etc/portage/profile/package.use.force
	cd etc/portage/profile; \
		install -m 644 ${PFILES} ${DESTDIR}/etc/portage/profile
