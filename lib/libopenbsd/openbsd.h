/* $Id$
 *
 * header for libopenbsd
 */

#include <sys/stat.h>
#include <sys/types.h>

#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#ifndef __dead
#define __dead		__attribute__((__noreturn__))
#endif

extern size_t	 strlcat(char *, const char *, size_t);
extern size_t	 strlcpy(char *, const char *, size_t);
extern void	*reallocarray(void *, size_t, size_t);
extern void	*recallocarray(void *, size_t, size_t, size_t);

extern int	 opterr;
extern int	 optind;
extern int	 optopt;
extern int	 optreset;
extern char	*optarg;
