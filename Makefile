# Install Ragnarok-specific files

MAKE = make -C

SUBDIRS	= bin usr etc boot

all: install

install:
	${MAKE} bin install
	${MAKE} boot install
	${MAKE} etc install
	${MAKE} usr install
