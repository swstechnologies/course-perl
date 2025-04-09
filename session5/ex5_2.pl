#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

# Main program
my $groups_to_process = ['po', 'ws'];
my $group_file = '/etc/group';
my $passwd_file = '/etc/passwd';

my $data_structure = build_structure($group_file, $passwd_file, $groups_to_process);
print_structure($data_structure);

# Function to build the data structure
sub build_structure {
    my ($group_file, $passwd_file, $groups_to_process) = @_;
    my %group_users;

    # Read group file and filter relevant groups details

    # Read passwd file and build user details

    # Build the main data structure

    # Return processed group user data structure
    return \%group_users;
}

# Function to print the data structure
sub print_structure {
    my ($data_structure) = @_;

    foreach my $group (sort keys %$data_structure) {
        print "Group: $group\n";
        foreach my $user (sort keys %{$data_structure->{$group}}) {
            print "  User: $user -> ";
            print join(", ", @{$data_structure->{$group}{$user}});
            print "\n";
        }
    }
}