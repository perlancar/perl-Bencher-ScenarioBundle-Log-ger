package Bencher::Scenario::LogGer::Overhead;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use File::Temp qw(tempfile);

my ($fh, $fname) = tempfile();

our $scenario = {
    summary => 'Measure startup overhead of various codes',
    modules => {
        'Log::Any' => {},
        'Log::ger' => {version=>'0.019'},
        'Log::ger::App' => {version=>'0.002'},
        'Log::ger::Output' => {version=>'0.005'},
        'Log::ger::Layout::Pattern' => {version=>'0'},
        'Log::Contextual' => {version=>'0'},
        'Log::Dispatch' => {version=>'0'},
        'Log::Dispatch::Null' => {version=>'0'},
        'Log::Log4perl' => {version=>'0'},
        'Log::Log4perl::Tiny' => {version=>'0'},
        'Log::Dispatchouli' => {version=>'0'},
    },
    code_startup => 1,
    participants => [
        {code_template=>'use Log::ger ();'},
        {code_template=>'use Log::ger;'},
        {code_template=>'use Log::ger; Log::ger->get_logger;'},
        {code_template=>'use Log::ger::App;'},
        {code_template=>'use Log::ger::App; use Log::ger;'},
        {code_template=>'use Log::ger::Plugin::OptAway; use Log::ger;'},
        {code_template=>'use Log::ger::Like::LogAny;'},
        {code_template=>'use Log::ger::Like::Log4perl;'},
        {code_template=>'use Log::ger::App;'},

        {code_template=>'use Log::Any;'},
        {code_template=>'use Log::Any q($log);'},

        {code_template=>'use Log::Contextual qw(:log);'},

        {code_template=>'use Log::Log4perl;'},

        {code_template=>'use Log::Log4perl::Tiny;'},

        {code_template=>'use Log::Dispatch;'},
        {code_template=>'use Log::Dispatch; my $null = Log::Dispatch->new(outputs=>[ ["Null", min_level=>"warn"] ])', tags=>['output']},

        {code_template=>'use Log::Dispatchouli;'},

        {code_template=>'use Log::ger::Output::Screen;', tags=>['output']},
        {code_template=>'use Log::ger::Output::Composite;', tags=>['output']},

        # TODO: Lg + Composite (2 outputs)
        # TODO: Lg + Composite (2 outputs + pattern layouts)
        # TODO: Log::Any + Screen
        # TODO: Log::Log4perl + easy_init
    ],
};

1;
# ABSTRACT:
