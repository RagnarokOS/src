# Makefile for usr/bin
# $Ragnarok: Makefile,v 1.10 2023/10/31 20:10:52 lecorbeau Exp $

MAKE	= make -C

# Some programs (e.g. mandoc) absolutely require running ./configure
# before 'make'.
CONFIGURE = mandoc

SUBDIRS	= yacc apply banner bsd-mailx doas mandoc rcs signify sysupdate
STANDALONE = checkhash

# miniroot.tgz requires less stuff
MINIROOTDIRS	= signify sysupdate

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
