# Install Ragnarok-specific files

MAKE = make -C

all: install

install:
	${MAKE} boot install
	${MAKE} etc install
	${MAKE} usr install
