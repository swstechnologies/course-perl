#!/usr/bin/perl


sub trim_spaces() {
	my($var) = @_ ;
	#     ^ -> start of line
	#     \s* -> Any number of spaces (greedy)
	#    (.*?) -> Group to be preserved (For Extraction)
	#    \s* -> Any number of spaces (greedy)
	#    $ -> End of Line
	$var =~ s/^\s*(.*?)\s*$/$1/g ;
	return $var ;
}

$var = "   Something with leading and trailing spaces !!! ";
$trimvar = &trim_spaces($var);
print "VAR=#$var#\n";
print "TRIMVAR=#$trimvar#\n" ;
