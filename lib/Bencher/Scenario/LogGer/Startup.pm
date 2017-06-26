package Bencher::Scenario::LogGer::Startup;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    modules => {
        'Log::ger' => {version=>'0.005'},
    },
    participants => [
        {name=>"baseline", perl_cmdline => ["-e1"]},

        {name=>"use Log::ger ()", module=>'Log::ger', perl_cmdline => ["-mLog::ger", "-e1"]},

        {name=>"use Log::ger" , module=>'Log::ger', perl_cmdline => ["-MLog::ger", "-e1"]},
        {name=>"use Log::ger + use Log::ger::Plugin::OptAway" , module=>'Log::ger::Plugin::OptAway', perl_cmdline => ["-MLog::ger::Plugin::OptAway", "-MLog::ger", "-e1"]},
        {name=>"use Log::ger + use Log::ger::Output::Screen" , module=>'Log::ger::Output::Screen', perl_cmdline => ["-MLog::ger", "-MLog::ger::Output=Screen", "-e1"]},
        {name=>"use Log::ger::Like::LogAny" , module=>'Log::ger::Like::LogAny', perl_cmdline => ["-MLog::ger::Like::LogAny", "-e1"]},

        {name=>"use Log::Any" , module=>'Log::Any', perl_cmdline => ["-MLog::Any", "-e1"]},
        {name=>"use Log::Any + use Log::Any::Adapter::Screen" , module=>'Log::Any::Adapter::Screen', perl_cmdline => ["-MLog::Any", "-MLog::Any::Adapter=Screen", "-e1"]},
    ],
};

1;
# ABSTRACT:
