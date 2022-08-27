#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use lib 'Task1_b/lib/';

use Catalyst::Test 'Task1_b';

ok( request('/')->is_redirect, 'Request should succeed' );
ok( request('/phonebook')->is_success, 'Request should succeed' );
ok( request('/phonebook/create')->is_redirect, 'Request should be a redirect to /phonebook' );
like( get('/phonebook'), qr/ID/ );

done_testing();
