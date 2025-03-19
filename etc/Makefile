# Makefile to quickly install everything.

PORTAGEDIR	= portage
USEDIR		= portage/package.use
ENVFILES	= ${PORTAGEDIR}/compiler-clang ${PORTAGEDIR}/compiler-gcc \
		  ${PORTAGEDIR}/nolto
USEFILES	= clang llvm gcc dhcpcd cronie mandoc media noX tmux
PFILES		= package.use.mask use.force use.mask
LOGROTATE	= logrotate.d/nftables logrotate.d/portage


# No 'all' target. 'make install' needs to be run.
all:
	@echo "Nothing to do for all, skipping..."

# Explicitely create all dirs first.
dirs:
	install -d ${DESTDIR}/etc
	install -d ${DESTDIR}/etc/dracut.conf.d
	install -d ${DESTDIR}/etc/local.d
	install -d ${DESTDIR}/etc/logrotate.d
	install -d ${DESTDIR}/etc/rsyslog.d
	install -d ${DESTDIR}/etc/smtpd

portagedirs:
	install -d ${DESTDIR}/etc/${PORTAGEDIR}
	install -d ${DESTDIR}/etc/${PORTAGEDIR}/env
	install -d ${DESTDIR}/etc/${PORTAGEDIR}/package.use
	install -d ${DESTDIR}/etc/${PORTAGEDIR}/profile/package.use.force

install: dirs portagedirs
	install -m 644 nftables.rules ${DESTDIR}/etc
	install -m 644 dracut.conf.d/gentoo.conf ${DESTDIR}/etc/dracut.conf.d
	install -m 755 local.d/rm-machineid.stop ${DESTDIR}/etc/local.d
	install -m 644 ${LOGROTATE} ${DESTDIR}/etc/logrotate.d
	install -m 644 rsyslog.d/nftables.log ${DESTDIR}/rsyslog.d
	install -m 644 smtpd/smtpd.conf ${DESTDIR}/smtpd
	install -m 644 make.conf ${DESTDIR}/etc/${PORTAGEDIR}
	install -m 644 package.env ${DESTDIR}/etc/${PORTAGEDIR}
	install -m 644 package.license ${DESTDIR}/etc/${PORTAGEDIR}
	install -m 644 ${ENVFILES} ${DESTDIR}/etc/${PORTAGEDIR}/env
	cd ${USEDIR}; \
		install -m 644 ${USEFILES} ${DESTDIR}/etc/${PORTAGEDIR}/${USEDIR}
	install -m 644 ${PORTAGEDIR}/profile/package.use.force/clang \
		${DESTDIR}/etc/${PORTAGEDIR}/profile/package.use.force
	cd ${PORTAGEDIR}/profile; \
		install -m 644 ${PFILES} ${DESTDIR}/etc/${PORTAGEDIR}/profile
