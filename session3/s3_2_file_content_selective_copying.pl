#!/usr/bin/perl

sub copy_file_contents {
    my ($srcfile, $tgtfile) = @_;

    # Check basic conditions
    if ( ! -e $srcfile) {
        die "Error: Source file '$srcfile' does not exist!";
    } elsif (-e $tgtfile) {
        die "Error: Target file '$filename' already exists!";
    }

    # File read / write setup
    open(my $ifh, '<', $srcfile) or die "Error: Source file '$srcfile' does not exist or cannot be opened!";
    open(my $ofh, '>', $tgtfile) or die "Error: Cannot write to target file '$tgtfile'!";

    # File reading -> filtering ->  writing operations
    while( my $line = <$ifh> ) {
        next if $line =~ /^\s*#/;  # Skip lines starting with optional spaces followed by '#'
        print $ofh $line;
    }

    # Closure of file handles
    close($ifh);
    close($ofh);
}

# Main program
if (@ARGV != 2) {
    die "Usage: $0 <source_file> <target_file>";
}

my ($source_file, $target_file) = @ARGV;

# Copy contents from source file to target file
copy_file_contents($source_file, $target_file);
# You could also call like this:
# copy_file_contents($ARGV[0], $ARGV[1]);
# or like this:
# copy_file_contents(@ARGV);

print "Source File '$source_file' read -> processed and successfully written to '$target_file'.\n";
