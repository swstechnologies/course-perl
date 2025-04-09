#!/usr/bin/perl

# Implement a program that helps a user
# Capture first all processes related to his userid
# Display the processes to user along with detail given by "ps -eaf " command
# It can also suggest how long process has been running and whether there is any issue with it
# Let him kill the process (belonging to him) by entering the process id
use strict;
use warnings;
use POSIX qw(strftime);

# Main program
sub main {
    my $user_id = get_user_id();
    my @processes = get_user_processes($user_id);
    display_processes(\@processes);
    my $pid_to_kill = get_process_to_kill();
    kill_process($pid_to_kill);
}

# Get the current user's ID
sub get_user_id {
    return $ENV{'USER'} || $ENV{'LOGNAME'};
}

# Get all processes for the given user ID
sub get_user_processes {
    my ($user_id) = @_;
    my @processes;
    open my $ps, '-|', "ps -f -u $user_id " or die "Cannot execute ps: $!";
    while (<$ps>) {
        my ($user, $pid, $etime, $cmd) = split(/\s+/, $_, 4);
        # Only compare 7 characters of the user ID to avoid issues with long usernames
        $user = substr($user, 0, 7);
        $user_id = substr($user_id, 0, 7);
        if ($user eq $user_id) {  
            push @processes, $_;
        }
    }
        close $ps;
    return @processes;
}

# Display processes to the user
sub display_processes {
    my ($processes_ref) = @_;
    print "Processes for your user ID:\n";
    foreach my $process (@$processes_ref) {
        print $process;
    }
}

# Prompt the user to enter a process ID to kill
sub get_process_to_kill {
    print "\nEnter the PID of the process you want to kill (or press Enter to skip): ";
    chomp(my $pid = <STDIN>);
    return $pid;
}

# Kill the specified process
sub kill_process {
    my ($pid) = @_;
    if ($pid) {
        my $result = kill 'TERM', $pid;
        if ($result) {
            print "Process $pid terminated successfully.\n";
        } else {
            print "Failed to terminate process $pid. Ensure it belongs to you and try again.\n";
        }
    } else {
        print "No process was terminated.\n";
    }
}

# Run the main program
main();
