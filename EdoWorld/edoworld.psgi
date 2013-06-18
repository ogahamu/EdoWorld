use strict;
use warnings;

use EdoWorld;

my $app = EdoWorld->apply_default_middlewares(EdoWorld->psgi_app);
$app;

