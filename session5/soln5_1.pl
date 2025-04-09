#!/usr/bin/perl
use strict;
use warnings;

# Function to calculate the average of an array of numbers
sub calculate_average {
    my @numbers = @_;
    my ($total, $values) = (0, 0);
    # Hash to store unit conversion factors
    my %unit_factors = (
        s  => 1,
        ms => 1/1000,
        us => 1/1_000_000,
        ns => 1/1_000_000_000,
    );


    foreach my $num (@numbers) {
        if ($num !~ /^-?\d+(\.\d+)?$/) {
           if ($num =~ /^(-?\d+(?:\.\d+)?)(ms|ns|us|s)$/) {
                my ($value, $unit) = ($1, $2);

                if (exists $unit_factors{$unit}) {
                    $num = $value * $unit_factors{$unit};
                } else {
                    warn "Invalid unit: $unit\n";
                    next;
                }
            } else {
                warn "Invalid number format: $num\n";
                next;
            }
        }
        $total += $num; $values++;
    }
    if ($values != @numbers) {
        print("Not all arguments are valid! For $values valid values => Total is $total \n");
    }
    return $values ? $total / $values : undef;
}

# Check if numbers are provided on the command line
if (@ARGV) {
    my $average = calculate_average(@ARGV);
    # Print based upon range in second / ms / us / ns
    if (defined $average) {
        if ($average >= 1) {
            $average = sprintf("%.3f s", $average);
        } elsif ($average >= 0.001) {
            $average = sprintf("%.3f ms", $average * 1000);
        } elsif ($average >= 0.000001) {
            $average = sprintf("%.3f us", $average * 1_000_000);
        } else {
            # Print in exponential notation
            $average = sprintf("%.3e", $average);
            # Use following in case ns unit is required
            # $average = sprintf("%.3f ns", $average * 1_000_000_000);
        }
        printf "The average delay is: %s\n", $average;
    } else {
        warn "Please provide delay as valid floating point numbers & units in arguments.\n";
    }
} else {
    warn "Please provide delay as valid floating point numbers & units in arguments.\n";
}