#!/usr/bin/perl

use Data::Dumper;


sub trim {
    my ($string) = @_;
    $string =~ s/^\s+|\s+$//g;
    return $string;
}

sub capture_contents {
    my ($filename) = @_;
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
    my @contents = <$fh>;
    close($fh);
    return @contents;
}

sub display_contents {
    my ($contents) = @_;
    foreach my $line (@$contents) {
        print $line;
    }
}

#
# The function processes each section's line data and extract the relevant data points into the HoH structure
# The HoH structure will have the following format:
# $log_data->{'data'}{$process}{$voltage}{$temperature}{$cell}{'TYPE'} = $type;
# $log_data->{'data'}{$process}{$voltage}{$temperature}{$cell}{'Power'} = $power;
# $log_data->{'data'}{$process}{$voltage}{$temperature}{$cell}{'Delay'} = $delay;
sub process_sections {
    my($hash) = @_;
    # print "Processing Sections\n";
    foreach my $section (keys %{$hash->{'section'}} ) {
        print "\nPROCESSING Section: $section\n";
        # Process $section with pattern "Process: 5nm  /  Voltage: 0.8V  \  Temperature: 125C " and 
        # extract Process Voltage and Temperature using match pattern
        our $process, $voltage, $temperature;
        if ($section =~ /Process:\s*(\S+)\s*\/\s*Voltage:\s*(\S+)\s*\\\s*Temperature:\s*(\S+)/) {
            $process = $1;
            $voltage = $2;
            $temperature = $3;
            print "Extracted -> Process: $process, Voltage: $voltage, Temperature: $temperature\n";
            $hash->{'section'}{$section}{'process'} = $process;
            $hash->{'section'}{$section}{'voltage'} = $voltage;
            $hash->{'section'}{$section}{'temperature'} = $temperature;
            $hash->{'data'}{$process}{$voltage}{$temperature} = {};
        } else {
            print "No match found for section: $section\n";
            next;
        }
        foreach my $line (@{$hash->{'section'}{$section}{'content'}}) {
            chomp($line); $line =~ s/\s+//g;    # Remove spaces
            @fields = split(/\|/, $line);
            # Remove spaces from all fields
            # print "Num: $num\n";
            if( @fields > 2 && $line !~ /Cell.*Type.*Power/) {
                print "Process CELL line: $line\n";
                my($cell, $type, $power, $delay) = @fields;
                $hash->{'data'}{$process}{$voltage}{$temperature}{$cell} = {};
                $hash->{'data'}{$process}{$voltage}{$temperature}{$cell}{'TYPE'} = $type;
                $hash->{'data'}{$process}{$voltage}{$temperature}{$cell}{'Power'} = $power;
                $hash->{'data'}{$process}{$voltage}{$temperature}{$cell}{'Delay'} = $delay;
            }
        }
    }
}

# Process the log file and extract relevant data
# The function will take the log file as input and return a hash of hashes (HoH) structure
# The function will first extract the meta data and section data
# Then it will process the section data and extract the section lines
# The function will return a hash of hashes (HoH) structure with meta data and section data
sub process_log {
    my ($contents) = @_;
    my %log_data = (
        'meta' => {},
        'data' => {},
        'section' => {},
        );
    # Process sections
    $current_section = '';
    foreach my $line (@$contents) {
        chomp($line);
        $line = trim($line);
        # print "Processing line: #$line#\n";
        if( $line =~ m/^\s*$/ || $line =~ m/^\s*#/) {
            print "Skipping line (empty or comment): $line (Section:$current_section)\n";
            next;
        }
        # Process Design: {ALU_32} \ Version: 1.2
        if ( $line =~ m/^Design.*\{(.*?)\}.*Version: ([0-9.]+).*$/ ) {
            print "Processing Meta Data line: $line\n";
            # Process meta data
            $log_data{'meta'}{'designline'} = $line;
            $log_data{'meta'}{'design'} = $1;
            $log_data{'meta'}{'version'} = $2;
            next;
        }
        if ( $line =~ m/Process.*Voltage.*Temperature/ ) {
            # Start of new section
            $current_section = $line;
            $current_section =~ s/[{}]//g; $current_section = trim($current_section);
            # $log_data{'section'}{$1} = {};
            $log_data{'section'}{$current_section} = {};
            $log_data{'section'}{$current_section}{'name'} = $current_section;
            $log_data{'section'}{$current_section}{'content'} = [];
            next;
        }
        if( $current_section eq '' ) {
            # Skip lines before first section
            print "Skipping line (not belonging to any section:): $line\n";
            next;
        }
        push(@{$log_data{'section'}{$current_section}{'content'}}, $line);
    }
    print("========== Finished processing log file ==========\n");
    return \%log_data;
}  

# The function will create a CSV file with the sorted power consumption
# The CSV file will have the following format:
# Process,Voltage,Temperature,Cell,Type,Power,Delay
# The data will be displayed Process -> Voltage -> Temperature -> Cell -> Type -> Power -> Delay
sub dump_data_into_csv {
    # Dump data into CSV file
    my ($data) = @_;

    open my $fh, ">", "output.csv" or die "Could not open output.csv: $!";

    # Write header
    print $fh "Process,Voltage,Temperature,Cell,Type,Power,Delay\n";

    # Iterate through the HoH structure and write data
    foreach my $process (sort keys %$data) {
        foreach my $voltage (sort keys %{$data->{$process}}) {
            foreach my $temperature (sort keys %{$data->{$process}{$voltage}}) {
                foreach my $cell (sort keys %{$data->{$process}{$voltage}{$temperature}}) {
                    my $type = $data->{$process}{$voltage}{$temperature}{$cell}{'TYPE'};
                    my $power = $data->{$process}{$voltage}{$temperature}{$cell}{'Power'};
                    my $delay = $data->{$process}{$voltage}{$temperature}{$cell}{'Delay'};
                    print $fh join(",", $process, $voltage, $temperature, $cell, $type, $power, $delay) . "\n";
                }
            }
        }
    }

    close $fh or die "Could not close output.csv: $!";
    print "Data successfully written to output.csv\n";
}

# Process the data for sorted power consumption
# This function will create a CSV file with the sorted power consumption
# The CSV file will have the following format:
# Power:Process,Voltage,Temperature,Cell,Type,Power,Delay
# The data will be sorted by power consumption
# The function will take the log data as input and return the sorted power consumption
sub process_for_sorted_power_consumption($) {   
    my ($log_data) = @_;
    my $sorted_power_consumption = {};
    foreach my $process (sort keys %{$log_data->{'data'}}) {
        foreach my $voltage (sort keys %{$log_data->{'data'}{$process}}) {
            foreach my $temperature (sort keys %{$log_data->{'data'}{$process}{$voltage}}) {
                foreach my $cell (sort keys %{$log_data->{'data'}{$process}{$voltage}{$temperature}}) {
                    my $power = $log_data->{'data'}{$process}{$voltage}{$temperature}{$cell}{'Power'};
                    my $type = $log_data->{'data'}{$process}{$voltage}{$temperature}{$cell}{'TYPE'};
                    my $delay = $log_data->{'data'}{$process}{$voltage}{$temperature}{$cell}{'Delay'};
                    # Store the power consumption in a hash of arrays
                    push @{$sorted_power_consumption->{$power}}, "$process,$voltage,$temperature,$cell,$type,$power,$delay";
                }
            }
        }
    }

    print "Generating Sorted Power Consumption:\n";
    my $filename = "sorted_power.csv";
    open my $fh, ">", $filename or die "Could not open $filename: $!";
    print $fh "Power:Process,Voltage,Temperature,Cell,Type,Power,Delay\n";
    foreach my $power (sort {$a <=> $b} keys %$sorted_power_consumption) {
        print $fh "$power:", join(", ", @{$sorted_power_consumption->{$power}}), "\n";
    }
}

sub interact_with_user($) {
    # This function will interact with the user and display the data
    my ($log_data) = @_;
    while (1) {
        print "Enter Process: ";
        my $process = <STDIN>;
        chomp($process);
        print "Enter Voltage: ";
        my $voltage = <STDIN>;
        chomp($voltage);
        print "Enter Temperature: ";
        my $temperature = <STDIN>;
        chomp($temperature);
        print "Enter Cell: ";
        my $cell = <STDIN>;
        chomp($cell);
        # Call the function to get the data
        my $result = get_cell_data($log_data, $process, $voltage, $temperature, $cell);

        if ($result) {
            print "Process: $process, Voltage: $voltage, Temperature: $temperature, Cell: $cell\n";
            print "========= Type: $result->{'TYPE'}, Power: $result->{'Power'}, Delay: $result->{'Delay'} ========= \n";
        } else {
            print "No data found for Process: $process, Voltage: $voltage, Temperature: $temperature, Cell: $cell\n";
        }

        print "Do you want to query more data? (yes/[no]): ";
        my $response = <STDIN>;
        chomp($response);
        last if ( lc($response) ne 'yes' && lc($response) ne 'y' );
    }
    print "Exiting user interaction.\n";
}

# Function to retrieve cell data
sub get_cell_data {
    my ($log_data, $process, $voltage, $temperature, $cell) = @_;

    # Check if the data exists
    if (exists $log_data->{'data'}{$process}{$voltage}{$temperature}{$cell}) {
        return $log_data->{'data'}{$process}{$voltage}{$temperature}{$cell};
    } else {
        return undef;
    }
}

sub compute_design_parameters($) {
    my ($log_data) = @_;
    # Compute design parameters
    my $design_parameters = {};
    foreach my $process (sort keys %{$log_data->{'data'}}) {
        foreach my $voltage (sort keys %{$log_data->{'data'}{$process}}) {
            foreach my $temperature (sort keys %{$log_data->{'data'}{$process}{$voltage}}) {
                # Compute Total Power Consumption and Average Delay for the given process, voltage and temperature
                my $total_power = 0, $num_cells = 0;
                my $total_delay = 0, $avg_delay = 0;
                foreach my $cell (sort keys %{$log_data->{'data'}{$process}{$voltage}{$temperature}}) {
                    my $power = $log_data->{'data'}{$process}{$voltage}{$temperature}{$cell}{'Power'};
                    my $delay = $log_data->{'data'}{$process}{$voltage}{$temperature}{$cell}{'Delay'};
                    $total_power += $power;
                    $total_delay += $delay;
                    $num_cells++;
                }
                if ($num_cells > 0) {
                    $avg_delay = $total_delay / $num_cells;
                }
                # Store the design parameters
                $log_data->{'data'}{$process}{$voltage}{$temperature}{'TotalPower'} = $total_power;
                $log_data->{'data'}{$process}{$voltage}{$temperature}{'AverageDelay'} = $avg_delay;
            }
        }
    }
}

sub dump_design_data_into_csv($) {
    # Dump design data into CSV file
    my ($data) = @_;

    open my $fh, ">", "design_output.csv" or die "Could not open design_output.csv: $!";

    # Write header
    print $fh "Process,Voltage,Temperature,TotalPower,AverageDelay\n";

    # Iterate through the HoH structure and write data
    foreach my $process (sort keys %$data) {
        foreach my $voltage (sort keys %{$data->{$process}}) {
            foreach my $temperature (sort keys %{$data->{$process}{$voltage}}) {
                my $total_power = $data->{$process}{$voltage}{$temperature}{'TotalPower'};
                my $avg_delay = $data->{$process}{$voltage}{$temperature}{'AverageDelay'};
                print $fh join(",", $process, $voltage, $temperature, $total_power, $avg_delay) . "\n";
            }
        }
    }

    close $fh or die "Could not close design_output.csv: $!";
    print "Design data successfully written to design_output.csv\n";
}


# Main program
if (@ARGV != 1) {
    die "Usage: $0 <log_file> ";
}

my ($log_file) = @ARGV;
my @contents = capture_contents($log_file);
# display_contents(\@contents);

my $log_data = process_log(\@contents);
# print Dumper($log_data);
process_sections($log_data);
compute_design_parameters($log_data);

dump_data_into_csv($log_data->{'data'});
dump_design_data_into_csv($log_data->{'data'});
process_for_sorted_power_consumption($log_data);
print Dumper($log_data);

interact_with_user($log_data); # The function will interact with the user and display the data