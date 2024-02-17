#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

use File::Basename qw(dirname);
use lib dirname(dirname(__FILE__));
use Test::DH;
use File::Path qw(remove_tree make_path);
use Debian::Debhelper::Dh_Lib qw(!dirname);

sub has_man_db_tool {
	my ($tool) = @_;
	open(my $old_stderr, '>&', *STDERR) or error("dup(STDERR, tmp_fd): $!");
	open(*STDERR, '>', '/dev/null') or error("re-open stderr as /dev/null: $!");

	my $res = defined(`$tool --version`);
	open(*STDERR, '>&', $old_stderr) or error("dup(tmp_fd, STDERR): $!");
	close($old_stderr);
	return $res;
}

if (has_man_db_tool('man') || has_man_db_tool('man-recode')) {
	plan(tests => 2);
} else {
	plan(skip_all => 'Test requires man or man-recode');
}

our @TEST_DH_EXTRA_TEMPLATE_FILES = (qw(
    manpage-uncompressed.pod
    manpage-compressed.pod
    manpage-perl.pod
    libmanpage.so.1.2.3.pod
    libmanpage.so.9.2.3
));

each_compat_subtest {
    my ($compat) = @_;
	if (! -d 'generated-manpages') {
		# Static data that can be reused.  Generate only in the first test
		make_path('generated-manpages');
		for my $basename (qw(manpage-uncompressed manpage-compressed manpage-perl libmanpage.so.1.2.3)) {
			doit('pod2man', '--utf8', '-c', 'Debhelper', '-r', '1.0', "${basename}.pod",
				 "generated-manpages/${basename}.1");
		}
		doit('pod2man', '--utf8', '-c', 'Debhelper', '-r', '1.0', '-s', '3', 'manpage-perl.pod',
			'generated-manpages/manpage-perl.3perl');
		doit('gzip', '-9n', 'generated-manpages/manpage-compressed.1');
	}
    ok(run_dh_tool('dh_installman', 'generated-manpages/manpage-uncompressed.1',
				   'generated-manpages/manpage-compressed.1.gz',
				   'generated-manpages/manpage-perl.3perl',
				   'generated-manpages/libmanpage.so.1.2.3.1',
				   'libmanpage.so.9.2.3'));

    ok(-e 'debian/debhelper/usr/share/man/man1/manpage-uncompressed.1');
    ok(-e 'debian/debhelper/usr/share/man/man1/manpage-compressed.1');
    ok(-e 'debian/debhelper/usr/share/man/man3/manpage-perl.3');
    ok(-e 'debian/debhelper/usr/share/man/man1/libmanpage.so.1.2.3.1');
    ok(! -e 'debian/debhelper/usr/share/man/man9/libmanpage.so.9.2.9.2.3');
    ok(-l 'debian/debhelper/usr/share/man/man3/libmanpage.so.9.2.3');
    remove_tree('debian/debhelper', 'debian/tmp', 'debian/.debhelper');
};

each_compat_subtest {
    my ($compat) = @_;
	if (! -d 'generated-manpages') {
		# Static data that can be reused.  Generate only in the first test
		make_path('generated-manpages');
		for my $basename (qw(manpage-uncompressed manpage-compressed libmanpage.so.1.2.3)) {
			doit('pod2man', '--utf8', '-c', 'Debhelper', '-r', '1.0', "${basename}.pod",
				 "generated-manpages/${basename}.1");
		}
		doit('pod2man', '--utf8', '-c', 'Debhelper', '-r', '1.0', '-s', '3', 'manpage-perl.pod',
			'generated-manpages/manpage-perl.3perl');
		doit('gzip', '-9n', 'generated-manpages/manpage-compressed.1');
	}
	mkdirs('debian/debhelper/usr/share/man/man1');
	mkdirs('debian/debhelper/usr/share/man/man3');
	copy_file('generated-manpages/manpage-uncompressed.1', 'debian/debhelper/usr/share/man/man1/manpage-uncompressed.1');
	copy_file('generated-manpages/manpage-compressed.1.gz', 'debian/debhelper/usr/share/man/man1/manpage-compressed.1.gz');
	copy_file('generated-manpages/manpage-perl.3perl', 'debian/debhelper/usr/share/man/man3/manpage-perl.3perl');
	copy_file('generated-manpages/libmanpage.so.1.2.3.1', 'debian/debhelper/usr/share/man/man1/libmanpage.so.1.2.3.1');
	copy_file('libmanpage.so.9.2.3', 'debian/debhelper/usr/share/man/man3/libmanpage.so.9.2.3');
    ok(run_dh_tool('dh_installman'));
    ok(-e 'debian/debhelper/usr/share/man/man1/manpage-uncompressed.1');
    ok(-e 'debian/debhelper/usr/share/man/man1/manpage-compressed.1');
    ok(-e 'debian/debhelper/usr/share/man/man3/manpage-perl.3perl');
    ok(-e 'debian/debhelper/usr/share/man/man1/libmanpage.so.1.2.3.1');
    ok(! -e 'debian/debhelper/usr/share/man/man9/libmanpage.so.9.2.9.2.3');
    ok(-l 'debian/debhelper/usr/share/man/man3/libmanpage.so.9.2.3');
    remove_tree('debian/debhelper', 'debian/tmp', 'debian/.debhelper');
};

