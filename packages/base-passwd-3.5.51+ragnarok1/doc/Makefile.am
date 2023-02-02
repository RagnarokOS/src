EXTRA_DIST = users-and-groups.sgml
doc_DATA = users-and-groups.html users-and-groups.txt
CLEANFILES = $(doc_DATA)

users-and-groups.html: users-and-groups.sgml
	docbook2html --nochunks $<

users-and-groups.txt: users-and-groups.sgml
	LC_ALL=C.UTF-8 docbook2txt $<
