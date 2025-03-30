#!/usr/bin/perl
use POSIX qw(getppid getpgrp);

# Demonstrate some process-related functions in Perl
# Also showcases ternary operator

# Subroutine for getppid
sub demo_getppid {
    print "Parent Process ID (getppid): ", getppid(), "\n";
}

# Subroutine for kill
sub demo_kill {
    my $pid = $$;  # Current process ID
    print "Killing process $pid using kill...\n";
    kill(0, $pid) ? print "Process $pid exists\n" : print "Process $pid does not exist\n";
}

# Subroutine for exit
sub demo_exit {
    print "Exiting program with code 0\n";
    exit(0);
}

# Subroutine for getpgrp
sub demo_getpgrp {
    print "Process Group ID (getpgrp): ", getpgrp(), "\n";
}

# Main program
sub main {
    print "\nDemonstrating getppid:\n";
    demo_getppid();

    print "\nDemonstrating kill:\n";
    demo_kill();

    print "\nDemonstrating getpgrp:\n";
    demo_getpgrp();

    print "\nDemonstrating exit (this will terminate the program):\n";
    demo_exit();
}

main();

