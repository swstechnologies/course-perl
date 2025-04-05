#!/usr/bin/perl
use strict;
use warnings;

# Subroutine to demonstrate basic tr/// usage
sub basic_translation {
    my $string = "hello world";
    $string =~ tr/aeiou/12345/;
    print "After translation: $string\n"; # h2ll4 w4rld
}

# Subroutine to demonstrate character deletion with tr///
sub character_deletion {
    my $string = "Hello World i'm here";
    $string =~ tr/a-z //cd; # Deletes all characters not in (a-z and space)
    print "After deletion: $string\n"; # ello orld im here
}

# Call the subroutines
basic_translation();
character_deletion();
