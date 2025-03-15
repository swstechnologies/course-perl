#!/usr/bin/perl
use strict;
use warnings;

# each
sub example_each {
    my @arr = (1, 2, 3, 4, 5);
    while(my($index,$element) =  each(@arr)) {
        print "at index:$index => element: $element\n";
    }
}

# pop / push
sub example_pop_push {
    my @arr = (1, 2, 3, 4, 5);
    push(@arr, 8);  # Add element to the end
    print "After push: @arr\n";
    my $last_element = pop(@arr);  # Remove element from the end
    print "After pop: @arr\n";
    print "Popped element: $last_element\n";
}

# shift / unshift
sub example_shift_unshift {
    my @arr = (1, 2, 3, 4, 5);
    unshift(@arr, 0);  # Add element to the beginning
    print "After unshift: @arr\n";
    my $first_element = shift(@arr);  # Remove element from the beginning
    print "After shift: @arr\n";
    print "Shifted element: $first_element\n";
}

# splice
sub example_splice {
    my @arr = (1, 2, 3, 4, 5);
    my @removed_elements = splice(@arr, 1, 2, 6, 7);  # Remove 2 elements from index 1 and insert 6, 7
    print "After splice: @arr\n";
    print "Removed elements: @removed_elements\n";
}

# Call the subroutines
example_each();
example_pop_push();
example_shift_unshift();
example_splice();
