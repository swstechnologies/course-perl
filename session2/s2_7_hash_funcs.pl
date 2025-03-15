#!/usr/bin/perl

# each
sub example_each {
    my %hash = (a => 1, b => 2, c => 3);
    while (my ($key, $value) = each %hash) {
        print "Key: $key, Value: $value\n";
    }
}

# keys / values
sub example_keys_values {
    my %hash = (a => 1, b => 2, c => 3);
    my @keys = keys %hash;
    my @values = values %hash;
    print "Keys: @keys\n";
    print "Values: @values\n";
}

# exists / delete
sub example_exists_delete {
    my %hash = (a => 1, b => 2, c => 3);

    # Check if a key exists
    if (exists $hash{b}) {
        print "Key 'b' exists in the hash.\n";
    } else {
        print "Key 'b' does not exist in the hash.\n";
    }

    # Delete a key-value pair
    delete $hash{b};
    print "Key b has been deleted.\n";

    # Check again if the key exists
    if (exists $hash{b}) {
        print "Key 'b' exists in the hash.\n";
    } else {
        print "Key 'b' does not exist in the hash.\n";
    }
}

# Call the subroutine
example_each();
example_keys_values();
example_exists_delete();