#!/usr/bin/perl

# ===========================================================================
# Define and Use Basic Structural elements : SCALAR
# 
# ===========================================================================

sub define_and_print_scalar() {
    print("=" x 30, "    SCALAR    ", "=" x 30, "\n" );
    $first = 1 ;
    $second = "second" ;
    $third = 3.1 ;
    print("first=${first} second=${second} third=${third} <- these are scalars \n");
    print("=" x 75, "\n");
}

&define_and_print_scalar();
