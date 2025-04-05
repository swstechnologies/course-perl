#!/usr/bin/perl
use strict;
use warnings;

# Subroutine to demonstrate global matching
sub global_match {
    my $string = "cat bat rat mat";
    my @matches = $string =~ m/\b\w{3}\b/g;
    print "Global matches: ", join(", ", @matches), "\n";
}

# Subroutine to demonstrate using special variables
sub special_variables {
    my $string = "The price is \$100 in california.";
    if ($string =~ m/\$(\d+)/) {
        print "Matched number: $1\n";
        print "Entire match: $&\n";
        print "Before match: $`\n";
        print "After match: $'\n";
    } else {
        print "No match found in '$string'\n";
    }
}

# Main subroutine to call all examples
sub main {
    global_match();
    special_variables();
}

# Call the main subroutine
main();