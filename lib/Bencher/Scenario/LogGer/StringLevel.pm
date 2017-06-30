package Bencher::Scenario::LogGer::StringLevel;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark string_level()',
    participants => [
        {
            fcall_template => 'Log::ger::Util::string_level(<level>)',
        },
    ],
    datasets => [
        {args=>{level=>1}},
        {args=>{level=>'warn'}},
    ],
};

1;
# ABSTRACT:
