#!/usr/bin/perl

# use strict;


sub demoArrayUsage() {
    @array = (1, 2, 3, 4, 5);
    printf("Array elements: @array\n");

    $arraySize = @array;
    printf("Array size: %d\n", $arraySize);

    $firstElement = $array[0];
    printf("First element: %d\n", $firstElement);

    $lastElement = $array[$arraySize - 1];
    printf("Last element: %d\n", $lastElement);

    $array[0] = 10;
    printf("First element after update: %d\n", $array[0]);

    $array[$arraySize - 1] = 50;
    printf("Last element after update: %d\n", $array[$arraySize - 1]);

    $array[5] = 100;
    printf("Element at index 5: %d\n", $array[5]);

    $arraySize = @array;
    printf("Array size after adding element at index 5: %d\n", $arraySize);

    $array[10] = 1000;
    printf("Element at index 10: %d\n", $array[10]);

    printf("======= Array elements: @array\n");
    $array[6] = "something";
    if( !defined($array[6]) ) {
        printf("Element at index 6 is not defined\n");
    } else {
        print("Element at index 6: $array[6]\n");
    }

    $arraySize = @array;
    printf("Array size after adding element at index 10: %d\n", $arraySize);

    $array[20] = 2000;
    printf("Element at index 20: %d\n", $array[20]);

    $arraySize = @array;
    printf("Array size after adding element at index 20: %d\n", $arraySize);

    $array[100] = 10000;
    printf("Element at index 100: %d\n", $array[100]);

    $arraySize = @array;
    printf("Array size after adding element at index 100: %d\n", $arraySize);
}

sub demonstrate_arguments_passing() {
    $numArgs = @_ ; 
    printf("Number of arguments passed = %d\n", $numArgs);

    my($firstArg, $secondArg) = @_ ;
    print("firstArg: $firstArg\n");
    $thirdArg = $_[2];
    printf("Third argument passed = %s\n", $thirdArg);

    printf("First argument passed = %s\n", $firstArg);
    printf("Second argument passed = %s\n", $secondArg);    

    # for $arg (@_) {
    #     printf("Argument passed: %s\n", $arg);
    # }
}

# &demoArrayUsage();
&demonstrate_arguments_passing(@ARGV);
print("firstArg: $firstArg\n");
