#!/usr/bin/perl

# Function to demonstrate substring extraction
sub string_substr {
    my ($string, $start, $length) = @_;
    return substr($string, $start, $length);
}

# Function to demonstrate string uppercase conversion
sub string_uc {
    my $string = shift;
    return uc($string);
}

# Function to demonstrate string index finding
sub string_index {
    my ($string, $substring) = @_;
    return index($string, $substring);
}

# Function to demonstrate character translation
sub string_tr {
    my ($string) = @_;
    $string =~ tr/lo/iI/;
    return $string;
}

$baseStr = "Hello, World!";

# Demonstrate substring extraction
my $extracted = string_substr($baseStr, 7, 5);
print "Extracted substring: $extracted\n";

# Demonstrate string uppercase conversion
my $uppercase = string_uc($baseStr);
print "Uppercase string: $uppercase\n";

# Demonstrate string index finding
my $index = string_index($baseStr, "World");
print "Index of 'World': $index\n";

# Demonstrate character translation
my $translated = string_tr($baseStr);
print "Translated string: $translated\n";

