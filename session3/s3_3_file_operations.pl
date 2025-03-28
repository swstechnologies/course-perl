#!/usr/bin/perl
use strict;
use warnings;

# Subroutine to demonstrate stat and lstat
sub demo_stat_lstat {
    my $file = "example.txt";
    open my $fh, '>', $file or die "Cannot create file: $!";
    close $fh;

    my @stats = stat($file);
    print "stat() - File size: $stats[7] bytes\n";
    # print "stat() - File stats: @stats \n";

    my @lstats = lstat($file);
    print "lstat() - File size: $lstats[7] bytes\n";

    unlink $file;
}

# Subroutine to demonstrate umask
sub demo_umask {
    my $old_umask = umask(0022);
    print "Old umask: ", sprintf("%04o", $old_umask), "\n";

    my $file = "umask_test.txt";
    open my $fh, '>', $file or die "Cannot create file: $!";
    close $fh;

    my @stats = stat($file);
    print "File permissions: ", sprintf("%04o", $stats[2] & 07777), "\n";

    unlink $file;
}

# Subroutine to demonstrate chmod
sub demo_chmod {
    my $file = "chmod_test.txt";
    open my $fh, '>', $file or die "Cannot create file: $!";
    close $fh;

    chmod 0644, $file;
    print "Changed permissions to 0644 for $file\n";

    unlink $file;
}

# Subroutine to demonstrate link and unlink
sub demo_link_unlink {
    my $file = "original.txt";
    my $link = "hardlink.txt";

    open my $fh, '>', $file or die "Cannot create file: $!";
    close $fh;

    link($file, $link) or die "Cannot create hard link: $!";
    print "Hard link created: $link\n";

    # system("ls -l $file $link");

    unlink $link;
    unlink $file;
}

# Subroutine to demonstrate symlink
sub demo_symlink {
    my $file = "original.txt";
    my $symlink = "symlink.txt";

    open my $fh, '>', $file or die "Cannot create file: $!";
    close $fh;

    symlink($file, $symlink) or die "Cannot create symbolic link: $!";
    print "Symbolic link created: $symlink\n";

    # system("ls -l $file $symlink");

    unlink $symlink;
    unlink $file;
}

# Main program
sub main {
    print "Demonstrating stat and lstat:\n";
    demo_stat_lstat();

    print "\nDemonstrating umask:\n";
    demo_umask();

    print "\nDemonstrating chmod:\n";
    demo_chmod();

    print "\nDemonstrating link and unlink:\n";
    demo_link_unlink();

    print "\nDemonstrating symlink:\n";
    demo_symlink();
}

main();