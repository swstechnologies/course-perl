#!/usr/bin/perl

use Test;

BEGIN { plan tests => 4 }

use lib 'session2';
require 's2_5_string_funcs_2.pl';

# Test for string_substr
ok(string_substr("hello world", 0, 5) eq "hello", 'string_substr test');

# Test for string_uc
ok(string_uc("hello world") eq "HELLO WORLD", 'string_uc test');

# Test for string_index
ok(string_index("hello world", "world") == 6, 'string_index test');

# Test for string_tr
ok(string_tr("hello world", "l", "x") eq "hexxo worxd", 'string_tr test');