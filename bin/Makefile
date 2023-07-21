# Makefile for /bin dir

MAKE	= make -C

# There will be many directories
SUBDIRS	= oksh

install:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir && \
		${MAKE} $$_dir install; \
		done

clean:
	for _dir in ${SUBDIRS}; do \
		${MAKE} $$_dir clean; \
		done
