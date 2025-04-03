#!/usr/bin/perl

sub display_file_contents {
    my ($filename) = @_;
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
    while (my $line = <$fh>) {
        print $line;
    }
    close($fh);
}

if (@ARGV == 0) {
    die "Usage: $0 <file1> <file2> ...\n" . "This command read and display files' contents\n";
}
# Process each file passed as a command-line argument
foreach my $file (@ARGV) {
    display_file_contents($file);
}
