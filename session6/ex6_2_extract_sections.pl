#!/usr/bin/perl

use Data::Dumper;

sub capture_contents {
    my ($filename) = @_;
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
    my @contents = <$fh>;
    close($fh);
    return @contents;
}

sub extract_sections {
    my ($contents) = @_;
    my %log_data = (
            # Define structure for tracking
        );
    # Process sections
    my $current_section;
    # Init current_section to empty string
    # Write loop to iterate on 
    for ( ; $current_section ; ) {
        # Clean up line for processing
        # Check pattern and update detail

        # Found Section detail
        # Update section Tracking variable

        # Capture Line against section

    }
    print("========== Finished processing log file ==========\n");
    return \%log_data;
}  


# Main program
if (@ARGV != 1) {
    die "Usage: $0 <log_file> ";
}

my ($log_file) = @ARGV;
my @contents = capture_contents($log_file);
my $log_data = extract_sections(\@contents);
print Dumper($log_data);


