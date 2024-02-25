ifeq ($(DEB_HOST_ARCH_OS),linux)
	CONFFLAGS = WITH_SELINUX="yes"
endif
