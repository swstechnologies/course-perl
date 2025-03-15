#!/usr/bin/perl
# use strict;
# use warnings;

# Global variable
our $global_var = "I am a global variable";

sub demo_local_scope() {

    print "\tInside second level nested subroutine:\n";
    print "\tlexical_var = $lexical_var\n";
    print "\tdynamic_var => $dynamic_var\n";
    print "\tglobal_var => $global_var\n";
 }

sub demonstrate_scope {

    print "Inside subroutine:\n";
    print "global_var => $global_var\n";

    # Lexical variable with 'my'
    my $lexical_var = "I am a lexical variable";
    our $dynamic_var = "I am a dynamic variable";
    local $global_var = "I am a locally scoped global variable";

    print "lexical_var => $lexical_var\n";
    print "global_var => $global_var\n";
    print "dynamic_var => $dynamic_var\n";

    demo_local_scope();

    print "==========\n";
}

print "Before / Outside subroutine:\n";
print "global_var => $global_var\n";
print "==========\n";

demonstrate_scope();

print "After subroutine call:\n";
print "global_var => $global_var\n";

# Attempt to print lexical variable outside its scope (will cause an error)
# print "$lexical_var\n"; # Uncommenting this line will cause an error

