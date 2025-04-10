
use Data::Dumper;
use strict;

# Example 1: Squaring a list of numbers
sub square_numbers {
    my @numbers = @_;
    my @result = map { $_ * $_ } @numbers;
    return @result;
}

# Example 2: Converting a list of strings to uppercase
sub to_uppercase {
    my @strings = @_;
    return map { uc($_) } @strings;
}

# Example 3: Extracting the first character of each string
sub first_characters {
    my @strings = @_;
    return map { substr($_, 0, 1) } @strings;
}

# Example 4: Appending a suffix to each string
sub append_suffix {
    my ($suffix, @strings) = @_;
    return map { $_ . $suffix } @strings;
}

# Example 5: Filtering even numbers (using map for transformation)
sub filter_even_numbers {
    my @numbers = @_;
    return map { $_ % 2 == 0 ? $_ : () } @numbers;
}

# Example 6: Creating a hash from two lists (keys and values)
sub create_hash {
    my ($keysRef, $valuesRef) = @_;
    my $numKeys = $keysRef ? scalar(@$keysRef) : 0;
    # my %hash = map { ($keysRef->[$_], $valuesRef->[$_]) } 0..$numKeys-1; 
    # return %hash;
    # return map { ($keysRef->[$_], $valuesRef->[$_]) } 0..$numKeys-1;
    my %hash = ("a", 1, "b", 2, "c", 3);
    my %hash2 = ( "a" => 1, "b" => 2, "c" => 3);
    print Dumper(\%hash, \%hash2);
    return %hash;
}

# Example 7: Reversing each string in a list
sub reverse_strings {
    my @strings = @_;
    return map { scalar reverse($_) } @strings;
}

# Example 8: Generating a list of squares and cubes
sub squares_and_cubes {
    my @numbers = @_;
    return map { ($_ * $_, $_ * $_ * $_) } @numbers;
}

# Example 9: Filtering and transforming strings (e.g., only strings with length > 3, converted to uppercase)
sub filter_and_transform_strings {
    my @strings = @_;
    return map { uc($_) } grep { length($_) > 3 } @strings;
}

# Example 10: Flattening a list of array references
sub flatten_arrays {
    my @array_refs = @_;
    return map { @$_ } @array_refs;
}


# Example usage
my @nums = (1, 2, 3, 4, 5);
print "Squares: ", join(", ", square_numbers(@nums)), "\n";

my @words = ("apple", "banana", "cherry");
print "Uppercase: ", join(", ", to_uppercase(@words)), "\n";

print "First chars: ", join(", ", first_characters(@words)), "\n";

print "With suffix: ", join(", ", append_suffix("_fruit", @words)), "\n";

print "Even numbers: ", join(", ", filter_even_numbers(@nums)), "\n";


my @keys = ("a", "b", "c");
my @values = (1, 2, 3);
my %hash = create_hash(\@keys, \@values);
print Dumper(\%hash);

my @reversed = reverse_strings(@words);
print "Reversed: ", join(", ", @reversed), "\n";

my @squares_and_cubes = squares_and_cubes(@nums);
print "Squares and Cubes: ", join(", ", @squares_and_cubes), "\n";

push(@words, "tea", "pie");
my @filtered_transformed = filter_and_transform_strings(@words);
print "Filtered and Transformed: ", join(", ", @filtered_transformed), "\n";

my @array_refs = ([1, 2], [3, 4], [5]);
my @flattened = flatten_arrays(@array_refs);
print "Flattened: ", join(", ", @flattened), "\n";
