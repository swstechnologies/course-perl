#!/usr/bin/perl
use strict;
use warnings;

# Subroutine to demonstrate the time function
sub demonstrate_time {
    print "Current epoch time: ", time(), "\n";
}

# Subroutine to demonstrate the gmtime function
sub demonstrate_gmtime {
    my $gmtime = gmtime();
    print "Current GMT time: $gmtime\n";
}

# Subroutine to demonstrate the localtime function
sub demonstrate_localtime {
    my $localtime = localtime();
    my @localtime = localtime();
    print "------ Demonstration of context dependent return values ------\n";
    print "Current local time: $localtime\n";
    print "Current local time: ", join(",", @localtime), "\n";
    print "-" x 60, "\n";
}

# Subroutine to demonstrate the sleep function
sub demonstrate_sleep {
    my $sleep_time = 3;
    print "Sleeping for $sleep_time seconds...\n";
    sleep($sleep_time);
    print "Awake now!\n";
}

# Subroutine to demonstrate the utime function
sub demonstrate_utime {
    my $filename = "example.txt";
    open(my $fh, '>', $filename) or die "Cannot create file: $!";
    close($fh);


    print "Access and modification times for $filename\n";
    display_stat_times($filename);

    demonstrate_sleep();
    demonstrate_localtime();

    # Update access and modification times
    my $atime = time();
    my $mtime = time(); # Set to current time
    utime $atime, $mtime, $filename;
    # utime undef, undef, $filename; # Set to current time
    # system("cat $filename && echo 'test' >> $filename"); # May not work on few systems


    print "Updated access and modification times for $filename\n";
    display_stat_times($filename);

    unlink $filename;
}

sub display_stat_times {
    my($filename) = @_;

    # TODO: Display current access and modification times
    my @stats = stat($filename);
    my $access_time = localtime($stats[8]);
    my $mod_time = localtime($stats[9]);
    print "\tAccess time: $access_time\n";
    print "\tModification time: $mod_time\n";

}

# Main program
sub main {
    print "Demonstrating time functions:\n";
    demonstrate_time();
    demonstrate_gmtime();
    demonstrate_localtime();
    demonstrate_utime();
}

main();