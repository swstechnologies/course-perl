#!/usr/bin/perl
# Write a program that list all the files in folders
#  - Backticks
#  - chomp function
#  - die function

sub get_directory_contents {
    my ($dir) = @_;
    my @files = `ls $dir`;
    chomp @files;
    return @files;
}

if (@ARGV == 0) {
    die "Usage: $0 <folder1> <folder2> ...\n";
}

foreach my $dir (@ARGV) {
    my @files = get_directory_contents($dir);
    printf("Files in folder(%s): @files \n", $dir);
}
