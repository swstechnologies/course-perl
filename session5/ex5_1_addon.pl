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
    # Process all arguments as floating points number with their unit
    # e.g. ns ms us s => and then transform them to seconds
    my @converted_numbers;
    foreach my $arg (@ARGV) {
        if ($arg =~ /^([\d.]+)(ns|us|ms|s)$/) {
            my ($value, $unit) = ($1, $2);
            if ($unit eq 'ns') {
                push @converted_numbers, $value / 1_000_000_000;
            } elsif ($unit eq 'us') {
                push @converted_numbers, $value / 1_000_000;
            } elsif ($unit eq 'ms') {
                push @converted_numbers, $value / 1_000;
            } elsif ($unit eq 's') {
                push @converted_numbers, $value;
            }
        } else {
            die "Invalid format: $arg. Please use a valid format (e.g., 10ms, 5s).\n";
        }
    }

    my $average = calculate_average(@converted_numbers);
    print "The average delay is: $average\n";
} else {
    print "Please provide delay with valid floating point numbers as arguments.\n";
}