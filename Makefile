# Construct the Ragnarok base system
# $Ragnarok: Makefile,v 1.9 2024/03/04 17:41:47 lecorbeau Exp $

MAKE = make -C

SUBDIRS	= etc usr boot

all: 
	@echo "Nothing to do for 'all'."

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done
