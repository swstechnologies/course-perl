#!/usr/bin/perl

# Implement a program that helps a user
# Capture first all processes related to his userid
# Display the processes to user along with detail given by "ps -eaf " command
# It can also suggest how long process has been running and whether there is any issue with it
# Let him kill the process (belonging to him) by entering the process id
use strict;
use warnings;


# Main program
sub main {
    my $user_id = get_user_id();
    my @processes = get_user_processes($user_id);
    display_processes(\@processes);
    # my $pid_to_kill = get_process_to_kill();
    # kill_process($pid_to_kill);
}

# Get the current user's ID
sub get_user_id {
    return $ENV{'USER'} || $ENV{'LOGNAME'};
}

# Get all processes for the given user ID
sub get_user_processes {
    my ($user_id) = @_;
    my @processes;
    @processes = `ps -f -u $user_id`; # Get all processes for the user
    chomp @processes; # Remove newlines
    print "Processes for user $user_id:\n";
    print join("\n", @processes), "\n"; # Display processes 
    # Extract user processes

    return @processes;
}

# Display processes to the user
sub display_processes {
    my ($processes_ref) = @_;
    # Print all processes related to the user
}

# Prompt the user to enter a process ID to kill
sub get_process_to_kill {
    print "\nEnter the PID of the process you want to kill (or press Enter to skip): ";
}

# Kill the specified process
sub kill_process {
    my ($pid) = @_;
    # Kill Process ID
}

# Run the main program
main();
