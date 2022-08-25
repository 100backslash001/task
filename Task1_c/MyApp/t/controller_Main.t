use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyApp';
use MyApp::Controller::Main;

ok( request('/main')->is_success, 'Request should succeed' );
done_testing();
