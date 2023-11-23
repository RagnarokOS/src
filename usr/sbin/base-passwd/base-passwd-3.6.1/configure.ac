dnl Initialize the autoconf process
AC_INIT([base-passwd],
	m4_esyscmd_s([head -n1 debian/changelog | sed -n 's/.*(\(.*\)).*/\1/p']))
AC_CONFIG_SRCDIR([update-passwd.c])
AC_CONFIG_HEADERS([config.h])
AC_PREFIX_DEFAULT([/usr])
AM_INIT_AUTOMAKE([-Wall foreign])

dnl Let's see if all programs we need are installed
AC_PROG_CC
AC_PROG_INSTALL
AC_SYS_LARGEFILE

dnl Scan for things we need
AC_CHECK_FUNCS([putgrent])
AC_CHECK_LIB([selinux], [is_selinux_enabled])

dnl Check for debconf
AC_MSG_CHECKING([whether to enable debconf support])
AC_ARG_ENABLE([debconf],
  [AS_HELP_STRING([--disable-debconf], [disable support for debconf])],
  [],
  [enable_debconf=yes])
AC_MSG_RESULT($enable_debconf)
AS_IF([test "x$enable_debconf" != xno],
  [AC_CHECK_LIB([debconfclient], [debconfclient_new], [],
    [AC_MSG_ERROR(
      [debconf support not available (use --disable-debconf to disable)])])
   AC_DEFINE([HAVE_DEBCONF], [1], [Define if you have libdebconfclient])])

dnl Check whether to build the documentation 
AC_MSG_CHECKING([whether to build the documentation])
AC_ARG_ENABLE([docs],
  [AC_HELP_STRING([--disable-docs], [do not build and install documentation])],
  [],
  [enable_docs=yes])
AC_MSG_RESULT($enable_docs)
AM_CONDITIONAL(ENABLE_DOCS, test "x$enable_docs" = xyes)

dnl Finally output everything
AC_CONFIG_FILES([Makefile doc/Makefile man/Makefile])
AC_OUTPUT
