use strict;
use warnings;

use Task2;

my $app = Task2->apply_default_middlewares(Task2->psgi_app);
$app;

