#!/usr/bin/perl

# Implement a program (core in subroutine) that
# first asks the user for the input and then uses system() call to execute it
sub execute_command {
    print "Please enter a command to execute: ";
    chomp (my $command = <STDIN>);
    system ($command);
}

&execute_command () ;