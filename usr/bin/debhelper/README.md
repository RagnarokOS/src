# debhelper

This is a fork of Debian's debhelper collection of programs.

For the most part, this version is the same as upsteam's, but since
Ragnarok differs from Debian in certain ways, some changes are necessary.

Differences from upstream:

* the dh_installman script replaces the program names called by the
*has_man_db_tool*. Since Ragnarok uses mandoc by default, the man-db
binaries are all rename with the 'db' prefix.

