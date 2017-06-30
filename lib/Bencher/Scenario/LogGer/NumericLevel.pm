package Bencher::Scenario::LogGer::NumericLevel;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark numeric_level()',
    participants => [
        {
            fcall_template => 'Log::ger::Util::numeric_level(<level>)',
        },
    ],
    datasets => [
        {args=>{level=>1}},
        {args=>{level=>'warn'}},
    ],
};

1;
# ABSTRACT:
