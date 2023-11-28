=head1 NAME

Debconf::FrontEnd::Kde - GUI Kde frontend

=cut

package Debconf::FrontEnd::Kde;

use strict;
use warnings;
use IO::Handle;
use Fcntl;
use POSIX ":sys_wait_h";
use Debconf::Config;
use base "Debconf::FrontEnd::Passthrough";

=head1 DESCRIPTION

This frontend is a recommended KDE UI for Debconf. This frontend relays all
requests to the debconf-kde-helper application via Debconf Passthrough
protocol. The latter takes care of displaying actual UI.

By default, debugging output from debconf-kde-helper is silenced.  If you need
to see it, set C<DEBCONF_DEBUG=kde> in the environment.

=cut

=head2 clear_fd_cloexec

Clears FD_CLOEXEC flag for the specified file descriptor

=cut

sub clear_fd_cloexec {
	my $fh = shift;
	my $flags;
	$flags = $fh->fcntl(F_GETFD, 0);
	$flags &= ~FD_CLOEXEC;
	$fh->fcntl(F_SETFD, $flags);
}

=head2 init

This function takes care of starting and preparing debconf-kde-helper for the
communication with Debconf. It opens a pair of FIFO pipes and passes one end to
the debconf-kde-helper process and the other end to the Passthrough frontend.
Before returning, it makes sure that debconf-kde-helper is ready to accept
commands.

=cut

sub init {
	my $this = shift;

	$this->need_tty(0);

	# FIFO pipe for debconf -> helper (dc2hp) communication
	pipe my $dc2hp_readfh, my $dc2hp_writefh;
	# FIFO pipe for helper -> debconf (hp2dc) communication
	pipe my $hp2dc_readfh, my $hp2dc_writefh;

	my $helper_pid = fork();
	if (!defined $helper_pid) {
		die "Unable to fork for execution of debconf-kde-helper: $!\n";
	} elsif ($helper_pid == 0) {
		# Child: execute debconf-kde-helper
		# Close unneeded file handles for this end.
		close $hp2dc_readfh;
		close $dc2hp_writefh;
		# Clear FD_CLOEXEC flags
		clear_fd_cloexec($dc2hp_readfh);
		clear_fd_cloexec($hp2dc_writefh);
		my $debug = Debconf::Config->debug;
		local $ENV{QT_LOGGING_RULES} = 'org.kde.debconf.debug=false'
			unless $debug && 'kde' =~ /$debug/;
		my $fds = sprintf("%d,%d", $dc2hp_readfh->fileno(), $hp2dc_writefh->fileno());
		if (!exec("debconf-kde-helper", "--fifo-fds=$fds")) {
			print STDERR "Unable to execute debconf-kde-helper - is debconf-kde-helper installed?";
			exit(10);
		}
	}

	# Parent process
	# Close unneeded file handles for this end
	close $dc2hp_readfh;
	close $hp2dc_writefh;

	# Initialize Passthrough frontend
	$this->{kde_helper_pid} = $helper_pid;
	$this->{readfh} = $hp2dc_readfh;
	$this->{writefh} = $dc2hp_writefh;
	$this->SUPER::init();

	# Ping debconf-kde-helper and wait for the reply for 15 seconds
	my $timeout = 15;
	my $tag = $this->talk_with_timeout($timeout, "X_PING");
	unless (defined $tag && $tag == 0) {
		close $hp2dc_readfh;
		close $dc2hp_writefh;
		if (waitpid($helper_pid, WNOHANG) == $helper_pid) {
			# debconf-helper-kde has probably died already
			die "debconf-kde-helper terminated abnormally (exit status: " . WEXITSTATUS($?) . ")\n";
		} elsif (kill(0, $helper_pid) == 1) {
			# It has hung or something like that. Kill it forcefully.
			kill 9, $helper_pid;
			# Collect zombie
			waitpid($helper_pid, 0);
		}
		if (defined $tag) {
			die "debconf-kde-helper failed to respond to ping. Response was $tag\n";
		} else {
			die "debconf-kde-helper did not respond to ping in $timeout seconds\n";
		}
	}
}

=head2 shutdown

Closes pipes and waits for the debconf-kde-helper process to finish.

=cut

sub shutdown {
	my $this = shift;
	$this->SUPER::shutdown();
	if (defined $this->{kde_helper_pid}) {
	    waitpid $this->{kde_helper_pid}, 0;
		delete $this->{kde_helper_pid};
	}
}

=head1 AUTHOR

Modestas Vainius <modax@debian.org>

=cut

1;
