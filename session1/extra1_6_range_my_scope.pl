#!/usr/bin/perl

# ===========================================================================
# Range Operator
# my scope
# ===========================================================================

sub demonstrate_range_and_my_scope() {
    $i = 5 ;
    print("i=${i}\n");
    for my $i (1..10) {
        if ($i % 2 == 0) {
            print("Even number: i=$i\n");
        } else {
            print("Odd number: i=$i\n");
        }
    }
    print("i=${i}\n");
}

&demonstrate_range_and_my_scope();