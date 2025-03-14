#!/usr/bin/perl

# ===========================================================================
# Arguments passed to the script are stored in the array @ARGV
# For loop
# Control Flow demonstrated in function demonstrate_control_flow()
# ===========================================================================

sub demonstrate_control_flow() {
    for $arg (@_) {
        if ($arg < 1) {
            print("Age ${arg} : infant\n");
        } elsif ($arg < 3) {
            print("Age ${arg} : toddler\n");
        } elsif ($arg < 18) {
            print("Age ${arg}:  a minor\n");
        } elsif ($arg >= 18 && $arg < 60) {
            print("Age ${arg} : an adult\n");
        } else {
            print("Age ${arg}: a senior citizen\n");
        }
    }
}

if (@ARGV) {
    print("Arguments passed: @ARGV\n");
    &demonstrate_control_flow(@ARGV);
} else {
    print("No arguments passed! Please pass age numbers for categorization\n");
    print("Usage: perl $0 <arg1> <arg2> ... <argN>\n");
}
