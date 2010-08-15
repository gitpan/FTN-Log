# Copyright (c) 2001-2010 Robert James Clay.  All Rights Reserved.
# This is free software;  you can redistribute it and/or
# modify it under the same terms as Perl itself.

package FTN::Log;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

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


$VERSION = '0.04';

#  Logging subroutine:  logging(logfile, id, text)
sub logging {
    my($logfile, $id, @text) = @_;
    local(*F);
    my @x;
    my @month = ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
	     'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' );

    
#    print "$id @text\n" if($opt_v);  # also display it, if verbose set

    # write to the log file
    if($logfile eq "stdout") {
        open(F, ">&STDOUT") || die "$id: can't open log $logfile\n";
    }
    elsif($logfile eq "stderr") {
        open(F, ">&STDERR") || die "$id: can't open log $logfile\n";
    }
    else {
        open(F, ">>$logfile") || die "$id: can't open log $logfile\n";
    }
	
    @x = localtime;
    printf F "%s %02d %02d:%02d:%02d ",
	   $month[$x[4]], $x[3], $x[2], $x[1], $x[0]; 
    print F "$id @text\n";
    
    close(F);

    return;

}

# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is the documentation for this module. 

=head1 NAME

FTN::Log - Perl extension for logging Fidonet Technology Networks
(FTN) related processing.

=head1 SYNOPSIS

  use FTN::Log;

  logging($logfile, $id, %text); 


=head1 DESCRIPTION

 This is the documentation for the FTN::Log module.
 
 Available functions are as follows:
 
logging($logfile, $id, @text); 
    $logfile	= the logfile name and path
    $id		= a program descriptor 
    @text	= the text to be printed as the log entry

=head1 AUTHOR

Robert James Clay, jame@rocasa.us

=head1 SEE ALSO

perl(1).

=cut
