#!/usr/bin/perl

# Implement a program that demonstrate use of 
# grep and sort function in perl

sub process_array {
    my @array = @_;

    # Use grep to filter out even numbers
    my @filtered = grep { $_ % 2 == 0 } @array;

    # Use sort to sort the filtered numbers
    my @sorted = sort { $a <=> $b } @filtered;

    return @sorted;
}

if (@ARGV == 0) {
    die "Usage: $0 <number1> <number2> ...\n";
}
# Read input from command line arguments
my @input_array = @ARGV;

# Call the subroutine with the input array
my @result = process_array(@input_array);

print "Filtered and sorted array: @result\n";
