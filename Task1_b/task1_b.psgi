use strict;
use warnings;

use Task1_b;

my $app = Task1_b->apply_default_middlewares(Task1_b->psgi_app);
$app;

