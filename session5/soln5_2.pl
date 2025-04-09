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
    # This script initializes a hash named %group_info.
    # The hash is intended to store information about groups.
    # Further details about its usage and structure should be defined in the script.
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
        # Extract User Full Name
        my $user_full_name ;
        if ($desc) {
            $user_full_name = $desc ;
            $user_full_name =~ s/,.*//  if ($user_full_name =~ /,/); # Remove everything after the first comma
            $user_full_name =~ s/^\s+|\s+$//g;  # Trim leading and trailing whitespace
        }
        $user_info{$username} = {
            name => $user_full_name,
            uid   => $uid,
            gid   => $gid,
            home  => $home,
            shell => $shell,
        };
    }
    close $passwd_fh;

    # Build the main data structure
    # Iterate through each group in the group_info hash
    foreach my $group_name (keys %group_info) {
        my $group_id = $group_info{$group_name}{group_id};
        my %processed_users;

        # Add users explicitly listed in the group
        foreach my $member (@{$group_info{$group_name}{members}}) {
            if (exists $user_info{$member}) {
                my $user = $user_info{$member};
                $group_users{$group_name}{$member} = [
                    $member, $user->{home}, $user->{shell}, $member, $user->{uid}, $user->{gid}
                ];
                $processed_users{$member} = 1;
            }
        }

        # Add users whose primary group matches the group ID
        foreach my $username (keys %user_info) {
            my $user = $user_info{$username};
            if ($user->{gid} == $group_id && !$processed_users{$username}) {
                $group_users{$group_name}{$username} = [
                    $user->{name}, $user->{home}, $user->{shell}, $username, $user->{uid}, $user->{gid}
                ];
            }
            # Also update group_info members to include users with the same GID
            if ($user->{gid} == $group_id) {
                push @{$group_info{$group_name}{members}}, $username unless grep { $_ eq $username } @{$group_info{$group_name}{members}};
            }
        }
    }

    # Cleanup all users that are not part of the target groups
    foreach my $userid (keys %user_info) {
        my $user = $user_info{$userid};
        my $found = 0;
        foreach my $group_name (keys %group_users) {
            if (exists $group_users{$group_name}{$userid}) {
                $found = 1;
                last;
            }
        }
        if (!$found) {
            delete $user_info{$userid};
        }
    }

    # print "Group Info: ", Dumper(\%group_info);
    # print "User Info: ", Dumper(\%user_info);
    # print "Group Users: ", Dumper(\%group_users);

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