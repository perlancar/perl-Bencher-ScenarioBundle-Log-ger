package Bencher::Scenario::Log::ger::Startup;

use 5.010001;
use strict;
use warnings;

use Data::Dmp;
use File::Temp qw(tempdir tempfile);

# AUTHORITY
# DATE
# DIST
# VERSION

our $scenario = {
    summary => 'Benchmark startup of Log::ger vs some other modules',
    modules => {
        'Log::ger' => {},
        'Log::Any' => {},
    },
};

1;
# ABSTRACT:
