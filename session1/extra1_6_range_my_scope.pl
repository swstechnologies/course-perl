#!/usr/bin/perl

# ===========================================================================
# Range Operator
# for loop using range operator
# for loop equivalent to C's
# for loop on array
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
    for ($i = 0 ; $i < 10 ; $i++) {
        print("i=${i}\n");
    }
    print("i=${i}\n");
    print("=" x 75, "\n");

    @array = (12, 22, 33, 44, 55);
    print("array=@array\n");
    for my $i (@array) {
        print("i=${i}\n");
    }

}

&demonstrate_range_and_my_scope();