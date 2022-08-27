use strict;
use warnings;
use Test::More;
use lib 'Task1_b/lib/';


use Catalyst::Test 'Task1_b';
use Task1_b::Controller::Phonebook;

ok( request('/phonebook')->is_success, 'Request should succeed' );

done_testing();
