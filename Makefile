# Test before "Debianizing"

RAGNAROK_VERSION=01
NEXT_VERSION=02

install:
	install -d -m 755 -g 0 -o root /etc/default
	install -d -m 755 -g 0 -o root /etc/dpkg
	install -d -m 755 -g 0 -o root /etc/signify
	install -d -m 755 -g 0 -o root /etc/skel
	install -d -m 755 -g 0 -o root /etc/sysctl.d
	install -d -m 755 -g 0 -o root /usr/lib
	install -m 644 -g 0 -o root etc/default/grub /etc/default/
	install -m 644 -g 0 -o root etc/dpkg/buildflags.conf /etc/dpkg/
	install -m 644 -g 0 -o root etc/signify/ragnarok${RAGNAROK_VERSION}.pub /etc/signify/
	install -m 644 -g 0 -o root etc/signify/ragnarok${NEXT_VERSION}.pub /etc/signify/
	install -m 644 -g 0 -o root etc/skel/.kshrc /etc/skel/
	install -m 644 -g 0 -o root etc/skel/.profile /etc/skel/
	install -m 644 -g 0 -o root etc/sysctl.d/01-hardening.conf /etc/sysctl.d/
	install -m 644 -g 0 -o root etc/sysctl.d/02-hardening_net.conf /etc/sysctl.d/
	install -m 644 -g 0 -o root etc/ksh.kshrc /etc/
	install -m 644 -g 0 -o root etc/lsb-release /etc/
	install -m 644 -g 0 -o root etc/nftables.conf /etc/
	install -m 644 -g 0 -o root usr/lib/ragnarok-shlib /usr/lib/
