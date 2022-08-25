use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyApp';
use MyApp::Controller::Posts;

ok( request('/posts')->is_success, 'Request should succeed' );
done_testing();
