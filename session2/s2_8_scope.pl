#!/usr/bin/perl
# use strict;
# use warnings;

# Global variable
our $global_var = "I am a global variable(#1) declared at TOP";

sub demo_local_scope() {

    print "\tInside second level nested subroutine demo_local_scope():\n";
    print "\tblock_scope_var = $block_scope_var\n";
    print "\tdynamic_var => $dynamic_var\n";
    print "\tglobal_var => $global_var\n";
 }

sub demonstrate_scope {

    print "Inside demonstrate_scope() subroutine:\n";
    print "global_var => $global_var\n";

    # Block Scope variable with 'my'
    my $block_scope_var = "I am a BLOCK scope variable(#2)";
    our $dynamic_var = "I am a dynamic variable(#3)";
    local $global_var = "I am a locally scoped variable(#4) that over-rides GLOBAL global_var ";

    print "block_scope_var => $block_scope_var\n";
    print "global_var => $global_var\n";
    print "dynamic_var => $dynamic_var\n";

    demo_local_scope();

    print "==========\n";
}

print "Before / Outside demonstrate_scope() subroutine:\n";
print "global_var => $global_var\n";
print "==========\n";

demonstrate_scope();

print "After subroutine demonstrate_scope() call:\n";
print "global_var => $global_var\n";

# Attempt to print BLOCK scope variable outside its scope (will cause an error)
# print "$block_scope_var\n"; # Uncommenting this line will cause an error

