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

    # Read group file and filter relevant groups
    open my $group_fh, '<', $group_file or die "Cannot open $group_file: $!";
    my %group_info;
    while (<$group_fh>) {
        chomp;
        my ($group_name, $x, $group_id, $members) = split /:/;
        if (grep { $_ eq $group_name } @$groups_to_process) {
            $group_info{$group_name} = {
                group_id => $group_id,
                members  => [split /,/, $members],
            };
        }
    }
    close $group_fh;

    # Read passwd file and build user details
    open my $passwd_fh, '<', $passwd_file or die "Cannot open $passwd_file: $!";
    my %user_info;
    while (<$passwd_fh>) {
        chomp;
        my ($username, $x, $uid, $gid, $desc, $home, $shell) = split /:/;
        $user_info{$username} = {
            uid   => $uid,
            gid   => $gid,
            home  => $home,
            shell => $shell,
        };
    }
    close $passwd_fh;

    # Build the main data structure
    foreach my $group_name (keys %group_info) {
        my $group_id = $group_info{$group_name}{group_id};
        foreach my $member (@{$group_info{$group_name}{members}}) {
            if (exists $user_info{$member}) {
                my $user = $user_info{$member};
                $group_users{$group_name}{$member} = [
                    $member, $user->{home}, $user->{shell}, $member, $user->{uid}, $user->{gid}
                ];
            }
        }
    }

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