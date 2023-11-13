/* $Ragnarok: openbsd.h,v 1.3 2023/11/13 20:46:58 lecorbeau Exp $
 *
 * header for libopenbsd
 */

#include <sys/stat.h>
#include <sys/types.h>

#include <fcntl.h>
#include <fts.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#ifndef __dead
#define __dead		__attribute__((__noreturn__))
#endif

#ifndef howmany
#define howmany(x, y)	(((x)+((y)-1))/(y))
#endif

#ifndef major
#define major(x)	(((unsigned)(x) >> 8) & 0xff)
#endif

#ifndef minor
#define minor(x)	((unsigned)((x) & 0xff) | (((x) & 0xffff0000) >> 8))
#endif

#ifndef st_atimespec
#define st_atimespec	st_atim
#endif

#ifndef st_ctimespec
#define st_ctimespec	st_ctim
#endif

#ifndef st_mtimespec
#define st_mtimespec	st_mtim
#endif

#ifndef timespecclear
#define timespecclear(tsp)	(tsp)->tv_sec = (tsp)->tv_nsec = 0
#endif

#ifndef timespeccmp
#define timespeccmp(tsp, usp, cmp)					\
	(((tsp)->tv_sec == (usp)->tv_sec) ?				\
	    ((tsp)->tv_nsec cmp (usp)->tv_nsec) :			\
	    ((tsp)->tv_sec cmp (usp)->tv_sec))
#endif

#ifndef timespecisset
#define timespecisset(tsp)	((tsp)->tv_sec || (tsp)->tv_nsec)
#endif

#ifndef timespecsub
#define timespecsub(tsp, usp, vsp)					\
	do {								\
		(vsp)->tv_sec = (tsp)->tv_sec - (usp)->tv_sec;		\
		(vsp)->tv_nsec = (tsp)->tv_nsec - (usp)->tv_nsec;	\
		if ((vsp)->tv_nsec < 0) {				\
			(vsp)->tv_sec--;				\
			(vsp)->tv_nsec += 1000000000L;			\
		}							\
	} while (0)
#endif

#ifndef FMT_SCALED_STRSIZE
#define FMT_SCALED_STRSIZE 7	/* minus sign, 4 digits, suffix, null byte */
#endif

#ifndef MAXBSIZE
#define MAXBSIZE 65536
#endif

#ifndef _PW_NAME_LEN
#define _PW_NAME_LEN	31
#endif

#ifndef S_ISTXT
#define S_ISTXT 0
#endif

extern void	 errc(int, int, const char *, ...);
extern double	 fabs(double);
extern char	*fgetln(FILE *, size_t *);
extern int	 fmt_scaled(long long, char *);
extern char	*getbsize(int *, long *);
extern int	 getopt(int, char * const *, const char *);
extern double	 ldexp(double, int);
extern double	 log(double);
extern double	 log10(double);
extern double	 pow(double, double);
extern size_t	 strlcat(char *, const char *, size_t);
extern size_t	 strlcpy(char *, const char *, size_t);
extern void	 strmode(int, char *);
extern void	*reallocarray(void *, size_t, size_t);
extern void	*recallocarray(void *, size_t, size_t, size_t);
extern double	 scalbn(double, int);
extern double	 sqrt(double);
extern long long strtonum(const char *, long long, long long, const char **);
extern void	 verrc(int, int, const char *, va_list);
extern void	 vwarnc(int, const char *, va_list);
extern void	 warnc(int, const char *, ...);

extern int	 opterr;
extern int	 optind;
extern int	 optopt;
extern int	 optreset;
extern char	*optarg;
