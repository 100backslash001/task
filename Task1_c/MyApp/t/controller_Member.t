use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyApp';
use MyApp::Controller::Member;

ok( request('/member')->is_success, 'Request should succeed' );
done_testing();
