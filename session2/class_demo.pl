          my $x = '1234';
	  my $y = substr($x,1,2) ;
	  print "value of y = #$y# \n";
               for (substr($x,1,2)) {
	       	   print("Currently value of _=$_ and value of x is #$x# \n");
                   $_ = 'a';   print $x,"\n";    # prints 1a4
                   $_ = 'xyz'; print $x,"\n";    # prints 1xyz4
                   $x = '56789';
                   $_ = 'pq';  print $x,"\n";    # prints 5pq9
               }


