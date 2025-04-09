#!/usr/bin/perl

use Data::Dumper ;

# Cell   |  Type   |  Power (mW)  |  Delay (ns)
# U1     |  NAND2  |  0.85   |  0.12  
%ve_hash = (
	"125C" => {
		"U1" => { 
				'Type' => 'NAND2',
				'Power' => 0.85,
				'Delay' => 0.12
			},
		"U2" => {
				'Type' => 'xyz',
			}
	}
);

print Dumper \%ve_hash ;

