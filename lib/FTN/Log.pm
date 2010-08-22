# ftn-log

package FTN::Log;

use warnings;
use strict;
use Carp qw( croak );
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

=head1 NAME

FTN::Log - Perl extension for logging Fidonet Technology Networks (FTN) related processing.

=head1 VERSION

VERSION 0.06

=cut

$VERSION = '0.06';

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw(
);
@EXPORT_OK = qw(&logging
	
);

=head1 FUNCTIONS

=head2 logging

Syntax:  logging($log_file, $id, $text);

An FTN compatible Logging subroutine, where: 

=over

=item	$log_file Filename and path to the log file. Can also be STDOUT or STDERR.

=item	$id	Short string than can identify which program is doing the logging.

=item	$text	A string containing what is being logged.

=back
     
=cut

sub logging {
    my($log_file, $id, @text) = @_;
    local(*F);
    my @x;
    my @month = ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
	     'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' );

    
    # write to the log file
    if($log_file eq "stdout") {
        open(F, ">&STDOUT") || croak "$id: can't open log $log_file\n";
    }
    elsif($log_file eq "stderr") {
        open(F, ">&STDERR") || croak "$id: can't open log $log_file\n";
    }
    else {
        open(F, ">>$log_file") || croak "$id: can't open log $log_file\n";
    }
	
    @x = localtime;
    printf F "%s %02d %02d:%02d:%02d ",
	   $month[$x[4]], $x[3], $x[2], $x[1], $x[0]; 
    print F "$id @text\n";
    
    close(F);

    return;

}


=head1 AUTHOR

Robert James Clay, C<< <jame at rocasa.us> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-ftn-log at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=FTN-Log>. I will be
notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc FTN::Log

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=FTN-Log>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/FTN-Log>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/FTN-Log>

=item * Search CPAN

L<http://search.cpan.org/dist/FTN-Log>

=back

=head1 COPYRIGHT & LICENSE

Copyright 2001-2010 Robert James Clay, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=head1 SEE ALSO

"L<perl(1)>"

=cut

1; # End of FTN::Log

__END__
