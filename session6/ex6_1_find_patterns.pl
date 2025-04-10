#!/usr/bin/perl
use strict;
use warnings;

sub display_contents {
    my ($contents) = @_;
    while( my($index, $line) = each(@$contents)) {
        # Identify various parts of the file (Available in file input.txt )
        if ($line =~ /^Design/) {
            # Design Line found
            print "===== Design Detail FOUND: $line";
        } elsif ($line =~ /^\{ Process:/) {
            print "===== Section FOUND: $line";
        } elsif ($line =~ /\\End of report\\/) {
            print ">>> End of File encountered\n";
        }
        # print $line;
    }
}

sub capture_contents {
    my ($filename) = @_;
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
    my @contents = <$fh>;
    close($fh);
    return @contents;
}


# Main program
if (@ARGV != 1) {
    die "Usage: $0 <log_file> ";
}

my ($log_file) = @ARGV;
my @contents = capture_contents($log_file);
display_contents(\@contents);

__END__ ;
