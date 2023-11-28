# List here all source files with translatable strings.
POTFILES=$(sort $(shell find ../Debconf -type f -name \*.pm)) \
	../dpkg-* ../debconf-* ../debconf

POFILES=$(wildcard *.po)
MOFILES=$(POFILES:.po=.mo)

all: debconf.pot $(MOFILES)

install: all
	for file in $(MOFILES); do \
		lang=`echo $$file | sed 's/\.mo//'`; \
		install -d $(prefix)/usr/share/locale/$$lang/LC_MESSAGES/; \
		install -m 0644 $$file $(prefix)/usr/share/locale/$$lang/LC_MESSAGES/debconf.mo; \
	done

debconf.pot: $(POTFILES)
	@echo "Rebuilding the pot file"
	TZ=UTC xgettext $(POTFILES) -o debconf.pot.new -Lperl
	if [ -f debconf.pot ]; then \
		./remove-potcdate.pl < debconf.pot > debconf.1po && \
		./remove-potcdate.pl < debconf.pot.new > debconf.2po && \
		if cmp debconf.1po debconf.2po >/dev/null 2>&1; then \
			rm -f debconf.1po debconf.2po debconf.pot.new; \
		else \
			rm -f debconf.1po debconf.2po && \
			mv debconf.pot.new debconf.pot; \
		fi; \
	else \
		mv debconf.pot.new debconf.pot; \
	fi

clean:
	rm -f $(MOFILES) debconf.pot.new messages messages.mo

%.mo: %.po
	msgfmt -o $@ $<

%.po: debconf.pot
	@echo -n "Merging debconf.pot and $@"
	@msgmerge --previous $@ debconf.pot -o $@.new
	@mv -f $@.new $@
	@msgfmt --statistics $@

check:
	@for file in $(POFILES); do \
		lang=`echo $$file | sed 's/\.po//'`; \
		printf "$$lang: "; \
		msgfmt -o /dev/null -c -v --statistics $$lang.po;\
	done
