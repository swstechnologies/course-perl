#!/usr/bin/perl

# ==============================
# Loop control
# ==============================

sub demonstrate_loop_controls() {
    for $arg (@_) {
        print("Checking age: ${arg}\n");
        if ($arg >= 18) {
            print("Found an adult with age ${arg}! Skipping further checks\n");
            last;
        }
    }
}

if (@ARGV) {
    print("Arguments passed: @ARGV\n");
    &demonstrate_loop_controls(@ARGV);
} else {
    print("No arguments passed! Please pass various ages to figure if an adult is there?\n");
    print("Usage: perl $0 <arg1> <arg2> ... <argN>\n");
}
