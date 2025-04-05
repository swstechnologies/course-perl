#!/usr/bin/perl

sub demo_log_parsing() {
    my $log = '127.0.0.1 - - [05/Apr/2025:06:25:24 +0000] "GET /index.html HTTP/1.1" 200 4521';
    if ($log =~ /^([\d\.]+).*?\[(.*?)\] "\w+ (.*?) HTTP\/[\d\.]+" (\d{3})/) {
    	print "IP: $1, Date: $2, URL: $3, Status: $4\n";
    }
}

sub demo_camelcase_parsing() {
    my $text = "ThisIsCamelCase and this_is_not";
    while ($text =~ /\b[A-Z][a-z]+(?:[A-Z][a-z]+)+\b/g) {
    	print "CamelCase: $&\n";
    }
}

sub validate_ip_address() {
    my $ip = "Connect to 192.168.1.100 now";
    if ($ip =~ /\b\d{1,3}(?:\.\d{1,3}){3}\b/) {
	    print "IP Detected: $&\n";
    }
}

sub demo_reusable_patterns() {
    # Benefits : Compiled RegEx, No Double Escaping
    my $pattern = qr/\b\d{4}-\d{2}-\d{2}\b/;
    my $log = "Backup done on 2025-04-05";

    if ($log =~ /$pattern/) {
    	print "Date: $&\n";
    }
}


demo_log_parsing();
demo_camelcase_parsing();
validate_ip_address();
demo_reusable_patterns();
