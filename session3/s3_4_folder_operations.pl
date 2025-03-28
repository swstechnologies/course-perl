#!/usr/bin/perl

# Subroutine to demonstrate chdir
sub demo_chdir {
    my $dir = "test_dir";
    mkdir $dir or die "Cannot create directory: $!";
    chdir $dir or die "Cannot change directory: $!";
    print "Changed to directory: ", `pwd`;
    chdir ".." or die "Cannot change back to parent directory: $!";
    rmdir $dir or die "Cannot remove directory: $!";
}

# Subroutine to demonstrate mkdir and rmdir
sub demo_mkdir_rmdir {
    my $dir = "test_dir";
    mkdir $dir or die "Cannot create directory: $!";
    print "Directory created: $dir\n";
    rmdir $dir or die "Cannot remove directory: $!";
    print "Directory removed: $dir\n";
}

# Subroutine to demonstrate opendir
sub demo_opendir {
    my $dir = ".";
    opendir my $dh, $dir or die "Cannot open directory: $!";
    print "Directory opened: $dir\n";
    closedir $dh;
}

# Subroutine to demonstrate readdir and rewinddir
sub demo_readdir_rewinddir {
    my $dir = ".";
    opendir my $dh, $dir or die "Cannot open directory: $!";
    print "Contents of directory $dir:\n";
    while (my $entry = readdir $dh) {
        print "$entry\n";
    }
    rewinddir $dh;
    print "Contents of directory $dir after rewind:\n";
    while (my $entry = readdir $dh) {
        print "$entry\n";
    }
    closedir $dh;
}

# Subroutine to demonstrate chroot
sub demo_chroot {
    my $dir = "chroot_test";
    mkdir $dir or die "Cannot create directory: $!";
    chroot $dir or die "Cannot change root directory: $!";
    print "Changed root directory to: $dir\n";
    # Note: This will restrict the program to the new root directory
    # and may require superuser privileges to execute.
}

# Main program
sub main {
    demo_chdir();
    demo_mkdir_rmdir();
    demo_opendir();
    demo_readdir_rewinddir();
    demo_chroot();
}

main();