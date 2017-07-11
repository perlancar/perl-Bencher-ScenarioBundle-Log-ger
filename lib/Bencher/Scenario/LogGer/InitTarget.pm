package Bencher::Scenario::LogGer::InitTarget;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use File::Temp qw(tempfile);

my ($fh, $fname) = tempfile();

our $scenario = {
    summary => 'Benchmark init_target()',
    description => <<'_',

Each participant performs 1000 times init_target() to a single package, with
different configuration.

_
    participants => [
        {name=>"default" ,
         code_template => 'use Log::ger (); local %Log::ger::Global_Hooks = %Log::ger::Default_Hooks; for(1..1000) { undef $Log::ger::Global_Cache unless <cache>; Log::ger::init_target(package =>"main") }'},
        {name=>"with LGO:Screen" ,
         code_template => 'use Log::ger (); local %Log::ger::Global_Hooks = %Log::ger::Default_Hooks; use Log::ger::Output; Log::ger::Output->set("Screen"); for(1..1000) { undef $Log::ger::Global_Cache unless <cache>; Log::ger::init_target(package => "main") }'},
        {name=>"with LGO:File" ,
         code_template => 'use Log::ger (); local %Log::ger::Global_Hooks = %Log::ger::Default_Hooks; use Log::ger::Output; Log::ger::Output->set("File", path=>'.qq('$fname').'); for(1..1000) { undef $Log::ger::Global_Cache unless <cache>; Log::ger::init_target(package => "main") }'},
        {name=>"with LGO:Composite (0 outputs)" ,
         code_template => 'use Log::ger (); local %Log::ger::Global_Hooks = %Log::ger::Default_Hooks; use Log::ger::Output; Log::ger::Output->set("Composite"); for(1..1000) { undef $Log::ger::Global_Cache unless <cache>; Log::ger::init_target(package => "main") }'},
        {name=>"with LGO:Composite (Screen)" ,
         code_template => 'use Log::ger (); local %Log::ger::Global_Hooks = %Log::ger::Default_Hooks; use Log::ger::Output; Log::ger::Output->set("Composite", outputs=>{Screen=>{}}); for(1..1000) { undef $Log::ger::Global_Cache unless <cache>; Log::ger::init_target(package => "main") }'},
        {name=>"with LGO:Composite (Screen+File)" ,
         code_template => 'use Log::ger (); local %Log::ger::Global_Hooks = %Log::ger::Default_Hooks; use Log::ger::Output; Log::ger::Output->set("Composite", outputs=>{Screen=>{}, File=>{conf=>{path=>'.qq('$fname').'}}}); for(1..1000) { undef $Log::ger::Global_Cache unless <cache>; Log::ger::init_target(package => "main") }'},
        {name=>"with LGO:Composite (Screen+File & pattern layouts)" ,
         code_template => 'use Log::ger (); local %Log::ger::Global_Hooks = %Log::ger::Default_Hooks; use Log::ger::Output; Log::ger::Output->set("Composite", outputs=>{Screen=>{layout=>[Pattern=>{format=>"[%d] %m"}]}, File=>{conf=>{path=>'.qq('$fname').'}, layout=>[Pattern=>{format=>"[%d] [%P] %m"}]}}); for(1..1000) { undef $Log::ger::Global_Cache unless <cache>; Log::ger::init_target(package => "main") }'},
    ],
    precision => 7,
    datasets => [
        {name=>'normal'  , args=>{cache=>1}},
        {name=>'no-cache', args=>{cache=>0}},
    ],
};

1;
# ABSTRACT:
