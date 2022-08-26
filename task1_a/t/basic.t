use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('Task1_a');
$t->get_ok('/')->status_is(200)->content_like(qr/Array after sorting/i);

done_testing();