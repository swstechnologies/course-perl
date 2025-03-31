#! /usr/bin/perl

#Exercise 1
#  - Read a text file containing logs "server.log"
#  - Use grep to extract lines containing the word "ERROR" and 
#  - Display the line number along with the error message (SKIP THIS FIRST)
#  - Save these error lines into a new file "errors.log"
#

sub getContents() {
    my($file) = @_;
    @contents = `cat $file`;
    chomp(@contents);
    return @contents ;
}

# Extract lines containing ERROR pattern using grep
sub getErrorLines() {
}

# Write to file given as argument the contents passed on
sub writeToFile() {
}

# Main program
if (@ARGV != 1) {
    die "Usage: $0 <log_file> ";
}
my @logs = &getContents($ARGV[0]);
$lines = @logs ;
print("Received lines = $lines in the file $ARGV[0] \n");
#print(@logs);
my @errorLines = &getErrorLines(@logs);
&writeToFile('errors.log', \@errorLines);


