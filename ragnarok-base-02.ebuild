# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Ragnarok's base system files et all."
HOMEPAGE="https://github.com/RagnarokOS/src"
SRC_URI="https://github.com/RagnarokOS/src/releases/download/${PVR}/ragnarok-base-${PVR}.tgz"

LICENSE="ISC"
SLOT="${PV}"
KEYWORDS="amd64"

DEPEND="
	acct-group/sysupdate
	acct-user/sysupdate
	app-text/mandoc
	app-admin/doas
	app-admin/logrotate
	app-admin/rsyslog
	mail-client/mailx
	mail-mta/opensmtpd
	media-sound/alsa-utils
	net-firewall/nftables
	net-misc/chrony
	sec-policy/apparmor-profiles
	sys-apps/apparmor
	sys-apps/apparmor-utils
	sys-process/cronie
	app-misc/tmux
	net-misc/dhcpcd
	app-editors/opened
"
RDEPEND="${DEPEND}"
