#!/usr/bin/perl

# Implement a program that demonstrate use of split function
# on /etc/passwd file to extract user names and user ids along with home folder

sub demonstrate_split {
    my $passwdFileContents = `cat /etc/passwd `;
    my @lines = split(/\n/, $passwdFileContents);
    print "Username, UserID, Home Directory\n";
    foreach my $line (@lines) {
        next if $line =~ /^#/ ; # Regular Expression
        my @fields = split(/:/, $line);
        my ($username, $userid, $home) = @fields[0, 2, 5];
        print("($userid, $username, $home)\n");
    }
}

&demonstrate_split();
