#!/usr/bin/perl

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
    print("=" x 75, "\n");
    print("First:", \%first, "\n\n");
    print("First: ",
    	"first{first} = ", $first{"first"}, "\n",
    	"first{second_key} = ", $first{"second_key"}, "\n",
    	"first{third} = ", $first{"third"}, "\n",
	);
    print("=" x 75, "\n");

    print("second:", \%second, "\n");
    print("third:", \%third, "\n");
    print("First:\n" .
    		"Keys:", keys(%first), "\n",
		"Values:", values(%first), "\n");
}

&define_and_print_hash();
