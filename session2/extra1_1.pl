#!/usr/bin/perl

# Write a program that accepts a folder name and then lists all the files in that folder.
use strict;
use warnings;
use File::Basename;
use File::Spec;

print "Enter folder name: ";
chomp(my $folder = <STDIN>);

opendir(my $dh, $folder) or die "Cannot open directory $folder: $!";
my @files = readdir($dh);
closedir($dh);

foreach my $file (@files) {
    next if ($file eq '.' or $file eq '..');
    print "$file\n";
}
# print "Enter folder name: ";
# chomp(my $folder = <STDIN>);
