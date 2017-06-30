package Bencher::Scenario::LogGer::Startup;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use File::Temp qw(tempfile);

my ($fh, $fname) = tempfile();

our $scenario = {
    summary => 'Measure startup overhead of Log::ger vs other logging libraries',
    modules => {
        'Log::ger' => {version=>'0.011'},
        'Log::ger::Output' => {version=>'0.005'},
        'Log::ger::Layout::Pattern' => {version=>'0'},
    },
    participants => [
        {name=>"baseline", perl_cmdline => ["-e1"]},

        {name=>"use Log::ger ()", module=>'Log::ger', perl_cmdline => ["-mLog::ger", "-e1"]},

        {name=>"use Log::ger" , module=>'Log::ger', perl_cmdline => ["-MLog::ger", "-e1"]},
        {name=>"use Log::ger + use LGP:OptAway", module=>'Log::ger::Plugin::OptAway', perl_cmdline => ["-MLog::ger::Plugin::OptAway", "-MLog::ger", "-e1"]},
        {name=>"use Log::ger + use LGO:Screen", module=>'Log::ger::Output::Screen', perl_cmdline => ["-MLog::ger", "-MLog::ger::Output=Screen", "-e1"]},
        {name=>"use Log::ger + use LGO:File", module=>'Log::ger::Output::File', perl_cmdline => ["-e", qq(use Log::ger::Output File => (path=>'$fname'); use Log::ger)]},
        {name=>"use Log::ger + use LGO:Composite (0 outputs)", module=>'Log::ger::Output::Composite', perl_cmdline => ["-e", qq(use Log::ger::Output Composite; use Log::ger)]},
        {name=>"use Log::ger + use LGO:Composite (2 outputs)", module=>'Log::ger::Output::Composite', perl_cmdline => ["-e", qq(use Log::ger::Output Composite => (outputs=>{Screen=>{}, File=>{conf=>{path=>'$fname'}}}); use Log::ger)]},
        {name=>"use Log::ger + use LGO:Composite (2 outputs + pattern layouts)", module=>'Log::ger::Output::Composite', perl_cmdline => ["-e", qq(use Log::ger::Output Composite => (outputs=>{Screen=>{layout=>[Pattern=>{format=>"[%d] %m"}]}, File=>{conf=>{path=>'$fname'}, layout=>[Pattern=>{format=>"[%d] [%P] %m"}]}}); use Log::ger)]},
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
