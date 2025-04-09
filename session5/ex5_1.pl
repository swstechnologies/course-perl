#!/usr/bin/perl
use strict;
use warnings;

# Function to calculate the average of an array of numbers
sub calculate_average {
    my @numbers = @_;
    my $total = 0;

    foreach my $num (@numbers) {
        $total += $num;
    }

    return @numbers ? $total / @numbers : undef;
}

# Check if numbers are provided on the command line
if (@ARGV) {
    my $average = calculate_average(@ARGV);
    print "The average is: $average\n";
} else {
    print "Please provide floating point numbers as arguments.\n";
}