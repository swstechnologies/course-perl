#!/usr/bin/perl
use strict;
use warnings;

# Subroutine to demonstrate basic substitution
sub basic_substitution {
    my $string = "Namaste India!";
    $string =~ s/India/Bharat/;
    print "Basic Substitution: $string\n";
}

# Subroutine to demonstrate case-insensitive substitution
sub case_insensitive_substitution {
    my $string = "Namaste india!";
    $string =~ s/India/Bharat/i;
    print "Case-Insensitive Substitution: $string\n";
}

# Subroutine to demonstrate global substitution
sub global_substitution {
    my $string = "apple mango banana apple another apple... apple";
    print "Initial String: $string\n";
    $string =~ s/apple/orange/;
    print "Single Substitution: $string\n";
    $string =~ s/apple/orange/g;
    print "Global Substitution: $string\n";
}

# Subroutine to demonstrate substitution with evaluation
sub substitution_with_evaluation {
    my $string = "Price: 100";
    $string =~ s/(\d+)/$1 * 1.18/e; # Adding 18% GST
    print "Substitution with Evaluation: $string\n";
}

# Subroutine to demonstrate substitution with capturing groups
sub substitution_with_capturing {
    my $string = "Amit Sharma";
    $string =~ s/(\w+) (\w+)/$2, $1/;
    print "Substitution with Capturing Groups: $string\n";
}

# Subroutine to demonstrate substitution with delimiters
sub substitution_with_delimiters {
    my $string = "C:/Users/Amit/Documents";
    $string =~ s{/}{\\}g;
    print "Substitution with Delimiters: $string\n";
}

# Call all subroutines
basic_substitution();
case_insensitive_substitution();
global_substitution();
substitution_with_evaluation();
substitution_with_capturing();
substitution_with_delimiters();