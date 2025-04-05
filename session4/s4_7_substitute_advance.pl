#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;


# Subroutine to demonstrate advanced substitution with named captures
sub substitution_with_named_captures {
    my $string = "John Doe, Age: 30";
    $string =~ s/(?<first_name>\w+) (?<last_name>\w+), Age: (?<age>\d+)/$+{last_name}, $+{first_name} (Age: $+{age})/;
    # Named captures: $+{first_name}, $+{last_name}, $+{age}
    # $+{last_name} refers to the last name captured in the regex
    # $+{first_name} refers to the first name captured in the regex 
    print "var hash: ", Dumper(\%+), " \n";
    print "Substitution with Named Captures: $string\n";
}

# Subroutine to demonstrate conditional substitution
sub conditional_substitution {
    my $string = "The price is 100 dollars.";
    my $secondString = "The price is 40 dollars.";
    $string =~ s/(\d+)/$1 > 50 ? $1 * 0.9 : $1/e; # Apply 10% discount if price > 50
    print "Conditional Substitution string: $string\n";
    $secondString =~ s/(\d+)/$1 > 50 ? $1 * 0.9 : $1/e; # Apply 10% discount if price > 50
    print "Conditional Substitution secondString: $secondString\n";
}

# Subroutine to demonstrate substitution with code block
sub substitution_with_code_block {
    my $string = "apple banana cherry";
    $string =~ s/\b(\w+)\b/ucfirst($1)/ge; # Capitalize each word
    print "Substitution with Code Block: $string\n";
}

# Subroutine to demonstrate substitution with lookahead and lookbehind

sub substitution_with_lookahead_lookbehind {
    my $string = "foo123bar456baz";
    $string =~ s/(?<=foo)\d+(?=bar)/999/; # Replace digits between 'foo' and 'bar'
    print "Substitution with Lookahead and Lookbehind: $string\n";
    # (?<=foo) is a lookbehind assertion. It ensures that the match is preceded by the string "foo", but "foo" itself is not part of the match.
    # \d+ matches one or more digits. This is the actual part of the string that will be replaced.
    # (?=bar) is a lookahead assertion. It ensures that the match is followed by the string "bar", but "bar" itself is not part of the match.
    # Together, the pattern (?<=foo)\d+(?=bar) matches digits (\d+) that are:
    # Preceded by "foo" (lookbehind).
    # Followed by "bar" (lookahead).
}

# Subroutine to demonstrate non-greedy substitution
sub non_greedy_substitution {
    my $string = "abc123def456ghi";
    $string =~ s/\d+?/X/g; # Replace digits non-greedily
    print "Non-Greedy Substitution: $string\n";
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
substitution_with_named_captures();
conditional_substitution();
substitution_with_code_block();
substitution_with_lookahead_lookbehind();
non_greedy_substitution();
substitution_with_capturing();
substitution_with_delimiters();