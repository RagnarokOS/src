# $Ragnarok: Makefile,v 1.6 2025/01/17 01:01:47 lecorbeau Exp $

XSERV_VERSION	= 02
XSERV_DIR	= ragnarok-xserv_${XSERV_VERSION}_amd64
XPROGS_VERSION	= 02
XPROGS_DIR	= ragnarok-xprogs_${XPROGS_VERSION}_amd64
XFONTS_VERSION	= 02
XFONTS_DIR	= ragnarok-xfonts_${XFONTS_VERSION}_amd64

xserv:
	mkdir -p ${XSERV_DIR}/DEBIAN
	mkdir -p ${XSERV_DIR}/usr/share/doc/ragnarok-xserv/examples
	cp control.xserv ${XSERV_DIR}/DEBIAN/control
	cp changelog.xserv ${XSERV_DIR}/DEBIAN/changelog
	cp usr/share/doc/ragnarok-xserv/examples/.xinitrc \
		${XSERV_DIR}/usr/share/doc/ragnarok-xserv/examples/
	dpkg-deb -b ${XSERV_DIR} . 2>&1 | tee xserv_${XSERV_VERSION}.build

xprogs:
	mkdir -p ${XPROGS_DIR}/DEBIAN
	mkdir -p ${XPROGS_DIR}/usr/share/doc/ragnarok-xserv/examples
	cp control.xprogs ${XPROGS_DIR}/DEBIAN/control
	cp changelog.xprogs ${XPROGS_DIR}/DEBIAN/changelog
	cp usr/share/doc/ragnarok-xserv/examples/.cwmrc \
		${XPROGS_DIR}/usr/share/doc/ragnarok-xserv/examples/
	cp usr/share/doc/ragnarok-xserv/examples/.Xresources \
		${XPROGS_DIR}/usr/share/doc/ragnarok-xserv/examples/
	cp -r usr/share/doc/ragnarok-xserv/examples/polybar \
		${XPROGS_DIR}/usr/share/doc/ragnarok-xserv/examples/
	cp -r usr/share/X11/backgrounds ${XPROGS_DIR}/usr/share/X11
	dpkg-deb -b ${XPROGS_DIR} . 2>&1 | tee xprogs_${XPROGS_VERSION}.build

xfonts:
	mkdir -p ${XFONTS_DIR}/DEBIAN
	cp control.xfonts ${XFONTS_DIR}/DEBIAN/control
	cp changelog.xfonts ${XFONTS_DIR}/DEBIAN/changelog
	dpkg-deb -b ${XFONTS_DIR} . 2>&1 | tee xprogs_${XFONTS_VERSION}.build

pkgs: xserv xprogs xfonts
