#!/usr/bin/perl

# ===========================================================================
# Define and Use Basic Structural elements : ARRAY
# 
# ===========================================================================

sub define_and_print_array() {
    print("=" x 30, "    ARRAY    ", "=" x 30, "\n" );
    @first = ("one", "two", "three");
    @second = (1, 2, 3, 4, 5);
    @third = (1.1, 2.2, 3.3, 4.4, 5.5);
    @mixed = ("one", 1, 3.567, "something more");
    print("first=@first \n");
    print("second=@second \n");
    print("third=@third \n");
    print("mixed=@mixed \n");
    print("=" x 75, "\n\n");
}

&define_and_print_array();
