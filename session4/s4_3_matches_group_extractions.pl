#!/usr/bin/perl
use Data::Dumper;

sub demo_extract_words() {
    my $sentence = "Perl is concise, and powerful";
    my @words = ($sentence =~ /\b\w+\b/g);
    print "Words:|", join('#', @words), "|\n";
}

# Capturing groups
sub demo_extract_emails() {
    my $text = 'Send to sameer@example.com and srinivas@foo.in';
    while ($text =~ /(\w+@[\w\.]+)/g) {
      print "Found: $1\n";
    }
}

sub demo_extract_config() {
    my $config = "RAM=32GB, CPUs=8, Disk=1024GB";
    my @numbers = ($config =~ /(\d+)/g);
    print "Numbers: @numbers\n";
}

sub demo_extract_config() {
    my $config = "RAM=32GB, CPUs=8, Disk=1024GB";

    my @numbers = ($config =~ /(\d+)/g);
    print "Numbers: @numbers\n";

    my %config = ();
    while( $config =~ /(\w+)=(\d+\w*)/g ) {
    	$config{$1} = $2 ;
    }
    print Dumper \%config ;
}

demo_extract_words() ;
demo_extract_emails() ;
demo_extract_config() ;
