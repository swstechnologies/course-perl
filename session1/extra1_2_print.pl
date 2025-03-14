#!/usr/bin/perl

# Define and Use Basic Structural elements
# 

sub demo_print_statements() {
    print("=" x 30, " Demo repeat char pattern ", "-" x 30, "\n" );
    print("Simple print statements " . "-> that can be concatenated\n" . "Followed by 3 new lines ", "\n" x 3 );
}

sub demo_printf_statements() {
    printf("========= Demo Printf ==============\n");
    printf("This is a simple hello World statement\n");
    printf("\tThis is a simple hello World statement starting with tab\n");
    printf("    Int Val = %d\n", 345);
    printf("    Int Val = %d\n", 1235.6);
    printf("    Float Val = %f\n", 1235.654321);
    printf("    Float Val = %.2f\n", 1235.654321);
    printf("    Float Val = %.4f\n", 1235.654321);
    printf("    String Val = #%s#\n", "Hello World");
    printf("    String Val = #%20s#\n", "Hello World");
    printf("    String Val = #%-20s#\n", "Hello World");
    printf("Writing a percent char = %% \n");
}

&demo_print_statements();
&demo_printf_statements();
