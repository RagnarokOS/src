#!/usr/bin/perl -w

=head1 NAME

Debconf::FrontEnd::Gnome - GUI Gnome frontend

=cut

package Debconf::FrontEnd::Gnome;
use strict;
use utf8;
use Debconf::Gettext;
use Debconf::Config;
use Debconf::Encoding qw(to_Unicode);
use base qw{Debconf::FrontEnd};

=head1 DESCRIPTION

This FrontEnd is a Gnome UI for Debconf.

=head1 METHODS

=over 4

=item init

Set up most of the GUI.

=cut

our @ARGV_for_gnome=('--sm-disable');

sub create_assistant_page {
	my $this=shift;

	$this->assistant_page(Gtk3::VBox->new);
	$this->assistant->append_page($this->assistant_page);

	if ($this->logo) {
		$this->assistant->set_page_header_image($this->assistant_page, $this->logo);
	}

	$this->configure_assistant_page;
	$this->assistant_page->show_all;
}

sub configure_assistant_page {
	my $this=shift;

	$this->assistant->set_page_title($this->assistant_page, to_Unicode($this->title));
	$this->assistant->set_page_type($this->assistant_page, 'custom');
	$this->forward_button->grab_default;
	$this->forward_button->show;
	if ($this->capb_backup) {
		$this->back_button->show;
	} else {
		$this->back_button->hide;
	}
	$this->assistant->set_page_complete($this->assistant_page, 1);
}

sub reset_assistant_page {
	my $this=shift;

	$this->assistant_page($this->assistant->get_nth_page($this->assistant->get_current_page));
	foreach my $element ($this->assistant_page->get_children) {
		$this->assistant_page->remove($element);
	}
}

my $prev_page = 0;

# this gets called on clicking next/previous buttons
sub prepare_callback {
	my ($assistant, $page, $this) = @_;
	my $current_page = $assistant->get_current_page;

	if ($prev_page < $current_page) {
		$this->goback(0);
		if (Gtk3::main_level()) {
			Gtk3::main_quit();
		}
	} elsif ($prev_page > $current_page) {
		$this->goback(1);
		if (Gtk3::main_level()) {
			Gtk3::main_quit();
		}
	}
	$prev_page = $current_page;
}

sub close_callback {
	my ($assistant) = @_;

	my $title = gettext("Really quit configuration?");
	my $text = gettext("If you quit this configuration dialog, then the package being configured will probably fail to install, and you may have to fix it manually. This may be especially difficult if you are in the middle of a large upgrade.")."\n\n".gettext("You may need to quit anyway if you are stuck in a configuration loop due to a buggy package.")."\n";
	my $quit = gettext("_Quit");
	my $continue = gettext("Continue");

	my $dialog = Gtk3::Dialog->new_with_buttons(to_Unicode($title),
	                                            $assistant, "modal",
	                                            to_Unicode($quit), "yes",
	                                            to_Unicode($continue),
	                                            "no");
	$dialog->set_default_response("no");
	$dialog->set_border_width(3);

	my $grid = Gtk3::Grid->new();
	$grid->set_orientation("horizontal");
	$grid->set_column_homogeneous(0);
	$dialog->get_content_area->pack_start($grid, 1, 1, 5);
	$grid->show;
	
	my $alignment = Gtk3::Alignment->new(0.5, 0.0, 1.0, 0.0);
	$grid->add($alignment);
	$alignment->show;
	
	my $image = Gtk3::Image->new_from_icon_name("dialog-information", "dialog");
	$alignment->add($image);
	$image->show;
	
	my $label = Gtk3::Label->new(to_Unicode($text));
	$label->set_line_wrap(1);
	$grid->add($label);
	$label->show;

	my $response = $dialog->run;
	$dialog->destroy;

	exit 1 if $response eq "yes";
}

sub delete_event_callback {
	my ($assistant, $event) = @_;

	close_callback($assistant);
}

sub forward_page_func {
	my ($current_page, $assistant) = @_;

	return $current_page + 1;
}

sub on_forward {
	my ($button) = @_;

	my $assistant = $button->get_ancestor("Gtk3::Assistant");
	$assistant->next_page;
}

sub on_back {
	my ($button) = @_;

	my $assistant = $button->get_ancestor("Gtk3::Assistant");
	$assistant->previous_page;
}

sub init {
	my $this=shift;
	
	# Ya know, this really sucks. The authors of GTK seemed to just not
	# conceive of a program that can, *gasp*, work even if GTK doesn't
	# load. So this thing throws a fatal, essentially untrappable
	# error. Yeesh. Look how far I must go out of my way to make sure
	# it's not going to destroy debconf..
	if (fork) {
		wait(); # for child
		if ($? != 0) {
			die "DISPLAY problem?\n";
		}
	}
	else {
		# Catch scenario where the libraries we need are not installed.
		use Gtk3;

		@ARGV=@ARGV_for_gnome; # temporary change at first
		Gtk3->init;

		# Create a window, but don't show it.
		#
		# This has the effect of exercising gtk a bit in an
		# attempt to force an error either in the gtk bindings
		# themselves, but hopefully also in
		# gtk/glib/gsettings/etc. There is no guarantee that
		# this alone will provoke an error, but it's a
		# relatively safe and reasonable operation to perform
		# and further reduces the chance of the parent debconf
		# process ending up in an unrecoverable state.
		my $window = Gtk3::Window->new('toplevel');

		exit(0); # success
	}
	
	# Only load Gtk after the child has successfully proved it can do
	# the same. This avoids the problem where a module calls into a
	# native library and causes the perl interpreter to crash. When
	# we get to here, we know that the child didn't crash, so it
	# should be safe for us to attempt it.
	eval q{use Gtk3;};
	die "Unable to load Gtk -- is libgtk3-perl installed?\n" if $@;

	my @gnome_sucks=@ARGV;
	@ARGV=@ARGV_for_gnome;
	Gtk3->init;
	@ARGV=@gnome_sucks;
	
	$this->SUPER::init(@_);
	$this->interactive(1);
	$this->capb('backup');
	$this->need_tty(0);
	
	$this->assistant(Gtk3::Assistant->new);
	$this->assistant->set_position("center");
	$this->assistant->set_default_size(600, 400);
	my $hostname = `hostname`;
	chomp $hostname;
	$this->assistant->set_title(to_Unicode(sprintf(gettext("Debconf on %s"), $hostname)));
	$this->assistant->signal_connect("delete_event", \&delete_event_callback);

	my $distribution='';
	if (system('type lsb_release >/dev/null 2>&1') == 0) {
		$distribution=lc(`lsb_release -is`);
		chomp $distribution;
	} elsif (-e '/etc/debian_version') {
		$distribution='debian';
	}

	my $logo="/usr/share/pixmaps/$distribution-logo.png";
	if (-e $logo) {
		$this->logo(Gtk3::Gdk::Pixbuf->new_from_file($logo));
	}
	
	$this->assistant->signal_connect("close", \&close_callback);
	$this->assistant->signal_connect("prepare", \&prepare_callback, $this);
	$this->assistant->set_forward_page_func(\&forward_page_func, $this->assistant);

	$this->forward_button(Gtk3::Button->new_with_mnemonic(to_Unicode(gettext("_Next"))));
	$this->forward_button->set_can_focus(1);
	$this->forward_button->set_can_default(1);
	$this->forward_button->set_receives_default(1);
	$this->forward_button->signal_connect("clicked", \&on_forward);
	$this->assistant->add_action_widget($this->forward_button);

	$this->back_button(Gtk3::Button->new_with_mnemonic(to_Unicode(gettext("_Back"))));
	$this->back_button->set_can_focus(1);
	$this->back_button->set_receives_default(1);
	$this->back_button->signal_connect("clicked", \&on_back);
	$this->assistant->add_action_widget($this->back_button);

	$this->create_assistant_page();

	$this->assistant->show;
}

=item go

Creates and lays out all the necessary widgets, then runs them to get
input.

=cut

sub go {
        my $this=shift;
	my @elements=@{$this->elements};

	$this->reset_assistant_page;

	my $interactive='';
	foreach my $element (@elements) {
		# Noninteractive elements have no hboxes.
		next unless $element->hbox;

		$interactive=1;
		$this->assistant_page->pack_start($element->hbox, $element->fill, $element->expand, 0);
	}

	if ($interactive) {
		$this->configure_assistant_page;
		if ($this->assistant->get_current_page == $this->assistant->get_n_pages - 1) {
			# Create the next page so that GtkAssistant doesn't
			# hide the Forward button.
			$this->create_assistant_page();
		}
		Gtk3::main();
	}

	# Display all elements. This does nothing for gnome
	# elements, but it causes noninteractive elements to do
	# their thing.
	foreach my $element (@elements) {
		$element->show;
	}

	return '' if $this->goback;
	return 1;
}

sub progress_start {
	my $this=shift;
	$this->SUPER::progress_start(@_);

	$this->reset_assistant_page;

	my $element=$this->progress_bar;
	$this->assistant_page->pack_start($element->hbox, $element->fill, $element->expand, 0);
	# TODO: no backup support yet
	$this->configure_assistant_page;
	if ($this->assistant->get_current_page == $this->assistant->get_n_pages - 1) {
		$this->create_assistant_page();
	}
	$this->assistant->set_page_complete($this->assistant_page, 0);
	$this->assistant->show_all;

	while (Gtk3::events_pending()) {
		Gtk3::main_iteration();
	}
}

sub progress_set {
	my $this=shift;

	my $ret=$this->SUPER::progress_set(@_);

	while (Gtk3::events_pending()) {
		Gtk3::main_iteration();
	}

	return $ret;
}

sub progress_info {
	my $this=shift;
	my $ret=$this->SUPER::progress_info(@_);

	while (Gtk3::events_pending()) {
		Gtk3::main_iteration();
	}

	return $ret;
}

sub progress_stop {
	my $this=shift;
	$this->SUPER::progress_stop(@_);

	while (Gtk3::events_pending) {
		Gtk3::main_iteration;
	}

	if ($this->assistant->get_current_page == $this->assistant->get_n_pages - 1) {
		$this->create_assistant_page();
	}
	# automatically go to the next page now
	$this->assistant->set_current_page($prev_page + 1);
}

=back

=head1 AUTHOR

Eric Gillespie <epg@debian.org>
Gustavo Noronha Silva <kov@debian.org>

=cut

1
