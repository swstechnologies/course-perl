#!/usr/bin/perl

sub validate_date_format() {
    my $date = "Today is 05-04-2025";
    if ($date =~ /\b\d{2}-\d{2}-\d{4}\b/) {
        print "Valid date format found: $& \n";
    }
}

sub extract_command_flags() {
    my $arg = "--mode=debug";
    if ($arg =~ /--(\w+)=(\w+)/) {
	    print "Flag: $1, Value: $2 \n";
    }
}

validate_date_format() ;
extract_command_flags() ;
