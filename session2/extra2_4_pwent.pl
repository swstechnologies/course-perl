#!/usr/bin/perl

# Implement a program that lists all user-ids and their corresponding user-names along with home folder
use strict;
use warnings;

sub get_user_info {
    my %user_info;
    while (my ($name, $passwd, $uid, $gid, $quota, $comment, $gcos, $dir, $shell) = getpwent()) {
        $user_info{$uid} = { name => $name, home => $dir };
    }
    endpwent();
    return %user_info;
}

sub print_user_info {
    my %user_info = @_;
    foreach my $uid (sort { $a <=> $b } keys %user_info) {
        print "UID: $uid, Username: $user_info{$uid}->{name}, Home: $user_info{$uid}->{home}\n";
    }
}

my %user_info = get_user_info();
print_user_info(%user_info);
