# Ragnarok Makefile for /etc. LeCorbeau 2022/10/03
# Usage: export DESTDIR=/path/to/destdir && make

OWNER= root
GROUP= root

install:
	install -c -o ${OWNER} -g ${GROUP} -m 644 issue ${DESTDIR}/etc
	install -c -o ${OWNER} -g ${GROUP} -m 644 issue.net ${DESTDIR}/etc
	install -c -o ${OWNER} -g ${GROUP} -m 644 lsb-release ${DESTDIR}/etc
	install -c -o ${OWNER} -g ${GROUP} -m 664 motd ${DESTDIR}/etc
	install -c -o ${OWNER} -g ${GROUP} -m 600 nftables.conf ${DESTDIR}/etc
	install -c -o ${OWNER} -g ${GROUP} -m 644 os-release ${DESTDIR}/etc
	cd apt/preferences.d; \
		install -c -o ${OWNER} -g ${GROUP} -m 644 systemd \
			${DESTDIR}/etc/apt/preferences.d
	cd default; \
		install -c -o ${OWNER} -g ${GROUP} -m 644 grub \
			${DESTDIR}/etc/default
	cd dpkg/origins; \
		install -c -o ${OWNER} -g ${GROUP} -m 644 ragnarok \
			${DESTDIR}/etc/dpkg/origins
	cd grub.d; \
		install -c -o ${OWNER} -g ${GROUP} -m 755 05_debian_theme \
			${DESTDIR}/etc/grub.d
	cd logrotate.d; \
		install -c -o ${OWNER} -g ${GROUP} -m 644 rsyslog \
			${DESTDIR}/etc/logrotate.d
	cd rsyslog.d; \
		install -c -o ${OWNER} -g ${GROUP} -m 644 nftables-log.conf \
			${DESTDIR}/etc/rsyslog.d
	mkdir -p ${DESTDIR}/etc/signify
	cd signify; \
		install -c -o ${OWNER} -g ${GROUP} -m 644 *.pub \
			${DESTDIR}/etc/signify
	cd sysctl.d; \
		install -c -o ${OWNER} -g ${GROUP} -m 644 *.conf \
			${DESTDIR}/etc/sysctl.d
	cp skel/.bashrc ${DESTDIR}/etc/skel
	cp skel/.profile ${DESTDIR}/etc/skel

