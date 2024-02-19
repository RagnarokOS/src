# Makefile for usr/bin
# $Ragnarok: Makefile,v 1.17 2024/02/19 17:36:08 lecorbeau Exp $

MAKE	= make -C

# Some programs (e.g. mandoc) absolutely require running ./configure
# before 'make'.
CONFIGURE = mandoc

SUBDIRS	= yacc apply banner bsd-mailx doas mandoc rcs sysupdate who
STANDALONE = checkhash

# miniroot.tgz requires less stuff (this will be removed at some point.
MINIROOTDIRS	= signify sysupdate

DEBS	= signify sysupdate


all:
	@echo "Pre-configuring..."
	@for _dir in ${CONFIGURE}; do \
		cd $$_dir && \
		./configure; \
		done
	@echo "Running make..."
	@for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir; \
		done

deb:
	for _deb in ${DEBS}; do \
		cd $$_deb; \
			dch -n -p; \
			debuild -i -us -uc -b; \
		cd ..; \
	done

miniroot:
	for _dir in ${MINIROOTDIRS}; do \
		${MAKE} $$_dir install; \
		done

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
	install -m 755 -g 0 -o root ${STANDALONE} ${DESTDIR}/usr/bin

clean:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir clean; \
		done
