#!/usr/bin/perl

# Accepts one argument whose factorial has to be calculated
sub factorial() {
    my($num) = @_ ;
    $fact = 1;
    printf("Calculating Factorial for %d\n", $num);
    for ( ; $num > 1 ; $num = $num - 1 ) {
	    $fact = $fact * $num;
    }
    printf("\tfactorial(%d) = %d \n", $num, $fact);
}

# Multiple arguments whose factorial need to be calculated
sub demonstrate_factorial() {
    for $arg (@_) {
	    # Calculate value of factorial of $arg here
	    # printf("Call factorial func for %d here : \n", $arg) ;
	    &factorial($arg);
    }
}

if (@ARGV) {
    print("Arguments passed: @ARGV\n");
    &demonstrate_factorial(@ARGV);
} else {
    print("No arguments passed! Please pass values whose factorial need to be calculated\n");
    print("Usage: perl $0 <arg1> <arg2> ... <argN>\n");
}
