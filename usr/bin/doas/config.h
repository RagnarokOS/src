#ifndef CONFIG_H
#define CONFIG_H

#define UID_MAX 65535
#define GID_MAX 65535
#define HAVE_EXPLICIT_BZERO
/* #define HAVE_STRLCAT */
/* #define HAVE_STRLCPY */
/* #define HAVE_ERRC */
/* #define HAVE_VERRC */
/* #define HAVE_SETPROGNAME */
/* #define HAVE_READPASSPHRASE */
/* #define HAVE_STRTONUM */
#define HAVE_REALLOCARRAY
#define HAVE_EXECVPE
#define HAVE_SETRESUID
#define HAVE_SETRESGID
#define HAVE_SETREUID
#define HAVE_SETREGID
#define HAVE_CLOSEFROM
#define HAVE_SYSCONF
#define HAVE_DIRFD
#define HAVE_FCNTL_H
/* #define HAVE_F_CLOSEM */
#define HAVE_DIRENT_H
/* #define HAVE_SYS_NDIR_H */
#define HAVE_SYS_DIR_H
/* #define HAVE_NDIR_H */
/* #define HAVE_LOGIN_CAP_H */
#define HAVE___ATTRIBUTE__
#define HAVE_PAM_APPL_H
#define USE_PAM
#define DOAS_CONF "/etc/doas.conf"

#endif /* CONFIG_H */
