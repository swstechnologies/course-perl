#!/usr/bin/perl

sub extract_file_contents {
    my ($pattern, $srcfile) = @_;

    # Check basic conditions
    if ( ! -e $srcfile) {
        die "Error: Source file '$srcfile' does not exist!";
    }

    # File read / write setup
    open(my $ifh, '<', $srcfile) or die "Error: Source file '$srcfile' does not exist or cannot be opened!";

    # File reading -> filtering ->  writing operations
    while( my $line = <$ifh> ) {
        if( grep(/$pattern/, $line) ) {
            print STDOUT $line;
        }
    }

    # Closure of file handles
    close($ifh);
}

# Main program
if (@ARGV != 2) {
    die "Usage: $0 <pattern> <source_file> ";
}

my ($pattern, $source_file) = @ARGV;

# extract contents from file
#print "Source File '$source_file' get contents -> grep($pattern) -> display .\n";
extract_file_contents($pattern, $source_file);

