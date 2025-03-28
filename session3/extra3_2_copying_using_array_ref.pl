#!/usr/bin/perl

sub get_file_contents {
    my ($filename) = @_;
    open(my $fh, '<', $filename) or die "Error: Source file '$filename' does not exist or cannot be opened!";
    my @contents = <$fh>;   # NOTICE: Reading all lines at once -> Memory intensive for large files
    close($fh);
    return join('', @contents);
}

sub write_file_contents {
    my ($filename, $contents) = @_;
    if (-e $filename) {
        die "Error: Target file '$filename' already exists!";
    }
    open(my $fh, '>', $filename) or die "Error: Cannot write to target file '$filename'!";
    print $fh $contents;
    close($fh);
}

# Main program
if (@ARGV != 2) {
    die "Usage: $0 <source_file> <target_file>";
}

my ($source_file, $target_file) = @ARGV;

# Read contents from source file
my $contents = get_file_contents($source_file);

# Write contents to target file
write_file_contents($target_file, $contents);

print "File copied successfully from '$source_file' to '$target_file'.\n";