package Bencher::Scenario::LogGer::Startup;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Measure startup overhead of Log::ger vs other logging libraries',
    modules => {
        'Log::ger' => {version=>'0.010'},
    },
    participants => [
        {name=>"baseline", perl_cmdline => ["-e1"]},

        {name=>"use Log::ger ()", module=>'Log::ger', perl_cmdline => ["-mLog::ger", "-e1"]},

        {name=>"use Log::ger" , module=>'Log::ger', perl_cmdline => ["-MLog::ger", "-e1"]},
        {name=>"use Log::ger + use LGP:OptAway", module=>'Log::ger::Plugin::OptAway', perl_cmdline => ["-MLog::ger::Plugin::OptAway", "-MLog::ger", "-e1"]},
        {name=>"use Log::ger + use LGP:Screen", module=>'Log::ger::Output::Screen', perl_cmdline => ["-MLog::ger", "-MLog::ger::Output=Screen", "-e1"]},
        {name=>"use Log::ger::Like::LogAny" , module=>'Log::ger::Like::LogAny', perl_cmdline => ["-MLog::ger::Like::LogAny", "-e1"]},

        {name=>"use Log::Any" , module=>'Log::Any', perl_cmdline => ["-MLog::Any", "-e1"]},
        {name=>"use Log::Any + use LGA:Screen" , module=>'Log::Any::Adapter::Screen', perl_cmdline => ["-MLog::Any", "-MLog::Any::Adapter=Screen", "-e1"]},

        {name=>"use Log::Log4perl ()", module=>'Log::Log4perl', perl_cmdline => ["-mLog::Log4perl", '-e1']},
        {name=>"use Log::Log4perl + easy_init", module=>'Log::Log4perl', perl_cmdline => ["-MLog::Log4perl=:easy", '-e', 'Log::Log4perl->easy_init']},

        {name=>"use Log::Log4perl::Tiny ()", module=>'Log::Log4perl::Tiny', perl_cmdline => ["-mLog::Log4perl::Tiny", '-e1']},
        {name=>"use Log::Log4perl::Tiny :easy", module=>'Log::Log4perl::Tiny', perl_cmdline => ["-MLog::Log4perl::Tiny=:easy", '-e', 'Log::Log4perl->easy_init']},
    ],
};

1;
# ABSTRACT:
