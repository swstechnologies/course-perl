#!/usr/bin/perl

sub demo_match_patterns_1() {
    my $line = "System rebooted successfully";
    if ($line =~ /rebooted/) {
    	print "Reboot event detected.\n";
    }
}

sub demo_case_insensitive_match() {
    my $cmd = "Shutdown initiated";
    if ($cmd =~ /\bshutdown\b/i) {
        print "Shutdown command seen.\n";
    } else {
        print "No shutdown command detected.\n";
    }
}

demo_match_patterns_1() ;
demo_case_insensitive_match() ;
