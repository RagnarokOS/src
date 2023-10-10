# Makefile for usr/sbin
# $Ragnarok: Makefile,v 1.2 2023/10/10 18:28:35 lecorbeau Exp $

MAKE	= make -C

SUBDIRS	= dma

all:
	@echo "Running make..."
	@for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir; \
		done

miniroot:
	@echo "Nothing for miniroot yet"

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir install; \
		done

clean:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir clean; \
		done
