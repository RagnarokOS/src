/* Copyright 1988,1990,1993,1994 by Paul Vixie
 * All rights reserved
 *
 * Distribute freely, except: don't remove my name from the source or
 * documentation (don't take credit for my work), mark your changes (don't
 * get me blamed for your possible bugs), don't alter or remove this
 * notice.  May be sold if buildable source is provided to buyer.  No
 * warrantee of any kind, express or implied, is included with this
 * software; use at your own risk, responsibility for damages (if any) to
 * anyone resulting from the use of this software rests entirely with the
 * user.
 *
 * Send bug reports, bug fixes, enhancements, requests, flames, etc., and
 * I'll try to keep a version up to date.  I can be reached as follows:
 * Paul Vixie          <paul@vix.com>          uunet!decwrl!vixie!paul
 */

#if !defined(lint) && !defined(LINT)
static char rcsid[] = "$Id: user.c,v 2.8 1994/01/15 20:43:43 vixie Exp $";
#endif

/* vix 26jan87 [log is in RCS file]
 */


#include "cron.h"


void
free_user(u)
	user	*u;
{
	entry	*e, *ne;

	free(u->name);
	for (e = u->crontab;  e != NULL;  e = ne) {
		ne = e->next;
		free_entry(e);
	}
	free(u);
}


user *
load_user(crontab_fd, pw, name)
	int		crontab_fd;
	struct passwd	*pw;		/* NULL implies syscrontab */
	char		*name;
{
	char	envstr[MAX_ENVSTR];
	FILE	*file;
	user	*u;
	entry	*e;
	int	status;
	char	**envp, **tenvp;

	if (!(file = fdopen(crontab_fd, "r"))) {
		perror("fdopen on crontab_fd in load_user");
		return NULL;
	}

	Debug(DPARS, ("load_user()\n"))

	/* file is open.  build user entry, then read the crontab file.
	 */
	if ((u = (user *) malloc(sizeof(user))) == NULL) {
		errno = ENOMEM;
		return NULL;
	}
	if ((u->name = strdup(name)) == NULL) {
		free(u);
		errno = ENOMEM;
		return NULL;
	}
	u->crontab = NULL;

	/* 
	 * init environment.  this will be copied/augmented for each entry.
	 */
	if ((envp = env_init()) == NULL) {
		free(u->name);
		free(u);
		return NULL;
	}

	/*
	 * load the crontab
	 */
	Set_LineNum(1)
	do {
		status = load_env(envstr, file);
		switch (status) {
		case ERR:
			/* If envstr has no content, we reached a proper EOF
			 * and we can return to continue regular processing.
			 *
			 * If it does have content, we reached EOF without a
			 * newline, so we bail out
			 */
			if (envstr[0] != '\0') {
				log_it(u->name, getpid(), "ERROR", "Missing "
				"newline before EOF, this crontab file will be "
				"ignored");
				free_user(u);
				u = NULL;
			}
			goto done;
		case FALSE:
			e = load_entry(file, NULL, pw, envp);
			if (e) {
				e->next = u->crontab;
				u->crontab = e;
			} else {
				/* stop processing on syntax error */
				log_it(u->name, getpid(), "ERROR", "Syntax "
					"error, this crontab file will be "
					"ignored");
				free_user(u);
				u = NULL;
				goto done;
			}
			break;
		case TRUE:
			if ((tenvp = env_set(envp, envstr))) {
				envp = tenvp;
			} else {
				free_user(u);
				u = NULL;
				goto done;
			}
			break;
		}
	/* When counting lines, ignore the user-hidden header part, and account
	 * for idiosyncrasies of LineNumber manipulation
	 */
	} while (status >= OK && LineNumber < MAX_TAB_LINES + NHEADER_LINES + 2);

	if (LineNumber >= MAX_TAB_LINES + NHEADER_LINES + 2) {
		log_it(fname, getpid(), "ERROR", "crontab must not be longer "
				"than " Stringify(MAX_TAB_LINES) " lines, "
				"this crontab file will be ignored");
		free_user(u);
		u = NULL;
		goto done;
	}

 done:
	env_free(envp);
	fclose(file);
	Debug(DPARS, ("...load_user() done\n"))
	return u;
}