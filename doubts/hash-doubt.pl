#!/usr/bin/perl 

use Data::Dumper ;
  
# Creating a simple hash containing 
# different types of values 
my %hash = ( # value type string 
            'MyVehicle' => 'Car', 
              
            # value type integer 
            'Model' => 1234, 
              
            # value type float 
            'Speed' => 60.7,     
              
            # value type hash 
            'Traffic' => 
	    		{
				'Red' => 'Stop',          
				'Yellow' => 'Look and move',  
				'Green' => 'Go'
			}, 

            # value type array 
            'AllVehicles' => 
	    	[
			'Car',
			'Cycle',  
			'Bus',
			'Auto'
		]

      ); 
  
# printing values stored  
# at key 'Traffic' and 'AllVehicles' 
print "Traffic : $hash{'Traffic'}\n"; 
print "AllVehicles : $hash{'AllVehicles'}\n"; 

print "====== STAGE 1 ======\n";
my %newhash = (
	"first" => 1,
	"second" => 2.5,
	3 => "something string"
	);

$hash{'addonhash'} = \%newhash ;
print Dumper(\%hash);

print "====== STAGE 2 ======\n";
$hash{'Traffic'} =
	{
		'about' => "New Kind of Traffic Light",
		'blue' => "Blue has replaced GREEN",
		'ORANGE' => "Still Same",
		"WHITE"=> "white has replaced RED"
	} ;
print Dumper(\%hash);


print "====== STAGE 3 ======\n";
$hash{'Traffic'} = \%newhash ;
print Dumper(\%hash);


print "====== STAGE 4 ======\n";
delete($hash{'Traffic'});
print Dumper(\%hash);


