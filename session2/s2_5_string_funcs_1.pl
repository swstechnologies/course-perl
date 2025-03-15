#!/usr/bin/perl

# Function to demonstrate string length
sub string_length {
    my $string = shift;
    return length($string);
}

# Function to demonstrate string concatenation
sub string_concat {
    my ($string1, $string2) = @_;
    return $string1 . $string2;
}

# Function to demonstrate string comparison
sub string_compare {
    my ($string1, $string2) = @_;
    if ($string1 eq $string2) {
        return "Strings are equal";
    } else {
        return "Strings are not equal";
    }
}

# Function to demonstrate string substitution
sub string_substitute {
    my ($string, $pattern, $replacement) = @_;
    $string =~ s/$pattern/$replacement/;
    return $string;
}

# Function to demonstrate string splitting
sub string_split {
    my ($string, $delimiter) = @_;
    my @parts = split(/$delimiter/, $string);
    return @parts;
}

# Function to demonstrate string joining
sub string_join {
    my ($delimiter, @parts) = @_;
    return join($delimiter, @parts);
}

# Main script to test the functions
my $str = "Hello, World, Good Morning!";
print "Original string: $str\n";
print "Length: ", string_length($str), "\n";

my $str2 = " How are you?";
print "Concatenated string: ", string_concat($str, $str2), "\n";

print "Comparison: ", string_compare($str, $str2), "\n";

my $substituted_str = string_substitute($str, "World", "Perl");
print "Substituted string: $substituted_str\n";

my @split_str = string_split($str, ", ");
print "Split string: @split_str \n";

my $joined_str = string_join("#", @split_str);
print "Joined string: $joined_str\n";
