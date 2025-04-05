#!/usr/bin/perl
use strict;
use warnings;

# Subroutine for encrypting a message string from a-z to b-a
sub encrypt_message {
    my ($message) = @_;
    $message =~ tr/a-z/b-za/;
    return $message;
}

# Subroutine for translating digits to words
sub translate_numbers {
    my ($numbers) = @_;
    my %num_to_word = (
        '1' => 'one',
        '2' => 'two',
        '3' => 'three',
        '4' => 'four',
        '5' => 'five',
    );
    $numbers =~ s/([12345])/$num_to_word{$1}/g;
    return $numbers;
}

# Subroutine for removing vowels from a string
sub remove_vowels {
    my ($text) = @_;
    $text =~ tr/aeiou//d;
    return $text;
}

# Subroutine for counting occurrences of specific characters
sub count_character {
    my ($data, $char) = @_;
    my $count = ($data =~ tr/$char//);
    return $count;
}

# Example usage
my $message = "hello world";
print "Encrypted message: ", encrypt_message($message), "\n";

my $numbers = "1 2 345 some 356 here";
print "Translated numbers: ", translate_numbers($numbers), "\n";

my $text = "This is an example.";
print "Text without vowels: ", remove_vowels($text), "\n";

my $data = "abracadabra";
print "Number of 'a's: ", count_character($data, 'a'), "\n";