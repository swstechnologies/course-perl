#!/usr/bin/perl
use Data::Dumper;

sub capture_contents {
    my ($filename) = @_;
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
    my @contents = <$fh>;
    close($fh);
    return @contents;
}

# TODO: Bring back design here from ex6_2_extract_sections.pl
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

# TODO: Bring back function here from ex6_3_process_section_data.pl
sub process_sections {
    my($hash) = @_;
    # print "Processing Sections\n";
    # Run for loop on section
    foreach my $section (keys %{$hash->{'path_to_section_hash'}}) {
        print "\nPROCESSING Section: $section\n";
        # pattern "Process: 5nm  /  Voltage: 0.8V  \  Temperature: 125C " and 
        # extract Process Voltage and Temperature using match pattern

        # Process all lines in section that contain cell details
        # And capture it in hash
    }
}

# TODO: Bring back function here from ex6_4_compute_design_params.pl
sub compute_design_parameters($) {
    my ($log_data) = @_;
    # Compute design parameters
    my $design_parameters = {};
    foreach my $process (sort keys %{$log_data->{'path_to_log_data'}}) {
        # Compute Total Power Consumption and Average Delay for all the blocks
    }
}

# Process,Voltage,Temperature,Cell,Type,Power,Delay
# The data will be displayed like: Process -> Voltage -> Temperature -> Cell -> Type -> Power -> Delay
sub dump_raw_data_into_csv {
    # Dump data into CSV file
    my ($data) = @_;

    my $filename = "design_data.csv";
    open my $fh, ">", $filename or die "Could not open $filename: $!";

    # Write header
    print $fh "Process,Voltage,Temperature,Cell,Type,Power,Delay\n";

    # Iterate through the HoH structure and write data
    foreach my $process (sort keys %$data) {
            # At appropriate level, print the data
            # print $fh join(",", $process, $voltage, $temperature, $cell, $type, $power, $delay) . "\n";
    }

    close $fh or die "Could not close $filename: $!";
    print "Data successfully written to $filename\n";

}

# Main program
if (@ARGV != 1) {
    die "Usage: $0 <log_file> ";
}

my ($log_file) = @ARGV;

my @contents = capture_contents($log_file);
my $log_data = extract_sections(\@contents);
process_sections($log_data);
compute_design_parameters($log_data);
print Dumper($log_data);
dump_raw_data_into_csv($log_data);

