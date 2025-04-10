#!/usr/bin/perl


use strict;
use Data::Dumper;

sub print_perl_default_vars() {
    print("Perl default variables:\n"); 
    print("\$0: $0\n");
    print("\$1: $1\n");
    print(Dumper(\%ENV));
}

print_perl_default_vars;