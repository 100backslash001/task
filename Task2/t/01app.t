#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use lib 'Task2/lib/';

use Catalyst::Test 'Task2';

ok( request('/')->is_success, 'Request should succeed' );

done_testing();
