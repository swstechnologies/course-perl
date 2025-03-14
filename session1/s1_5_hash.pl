#!/usr/bin/perl
use Data::Dumper;

# ===========================================================================
# Define and Use Basic Structural elements : HASH / Associative Array
# ===========================================================================

sub define_and_print_hash() {
    print("=" x 30, "    HASH    ", "=" x 30, "\n" );
    %first = (
    	"first" => "first_val",
	"second_key" => 2.1,
	"third" => 3
    		);
    %second = (
    	"first" => "first_val",
	"second" => 2.1,
	"third" => 3
    		);
    %third = (
	    # Can be string 
	    "first" => "Can be an arbitrary sized string",

	    # Can be an array  (Not square brackets used for reference to array)
	    "second" => [1, 2, 3, 4, 5],

	    # Can be another hash / associative array (Not reference to hash)
	    "third" => { 1 => 2, 2 => 3, 3 => 4 } 
    	) ;
    print("First:", \%first, "\n");
    print("second:", \%second, "\n");
    print("third:", \%third, "\n");

    print Dumper(\%first);
    print Dumper(\%second);
    print Dumper(\%third);
}

&define_and_print_hash();
