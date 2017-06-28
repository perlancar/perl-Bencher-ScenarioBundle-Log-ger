package Bencher::Scenario::LogGer::NullOutput;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark Log::ger logging speed with the default/null output',
    modules => {
        'Log::ger' => {version=>'0.005'},
        'Log::ger::Plugin::SingleLog' => {},
        'Log::ger::Plugin::OptAway' => {},
        'Log::Any' => {},
        'Log::Fast' => {},
        'Log::Log4perl' => {},
    },
    participants => [
        {
            name => 'Log::ger-1mil_log_trace',
            perl_cmdline_template => ['-MLog::ger', '-e', 'for(1..1_000_000) { log_trace(q[]) }'],
        },
        {
            name => 'Log::ger-1mil_log_is_trace',
            perl_cmdline_template => ['-MLog::ger', '-e', 'for(1..1_000_000) { log_is_trace() }'],
        },
        {
            name => 'Log::ger+LGP:OptAway-1mil_log_trace',
            perl_cmdline_template => ['-MLog::ger::Plugin=OptAway', '-MLog::ger', '-e', 'for(1..1_000_000) { log_trace(q[]) }'],
        },
        {
            name => 'Log::ger+LGP:SingleLog-1mil_log_trace',
            perl_cmdline_template => ['-MLog::ger::Plugin=SingleLog', '-MLog::ger', '-e', 'for(1..1_000_000) { log("trace", q[]) }'],
        },
        {
            name => 'Log::ger+LGP:SingleLog-1mil_log_6',
            perl_cmdline_template => ['-MLog::ger::Plugin=SingleLog', '-MLog::ger', '-e', 'for(1..1_000_000) { log(6, q[]) }'],
        },

        {
            name => 'Log::Fast-1mil_DEBUG',
            perl_cmdline_template => ['-MLog::Fast', '-e', '$LOG = Log::Fast->global; $LOG->level("INFO"); for(1..1_000_000) { $LOG->DEBUG(q()) }'],
        },
        {
            name => 'Log::Fast-1mil_is_debug',
            perl_cmdline_template => ['-MLog::Fast', '-e', '$LOG = Log::Fast->global; for(1..1_000_000) { $LOG->level() eq "DEBUG" }'],
        },

        {
            name => 'Log::Any-no_adapter-1mil_log_trace',
            perl_cmdline_template => ['-MLog::Any', '-e', 'my $log = Log::Any->get_logger; for(1..1_000_000) { $log->trace(q[]) }'],
        },
        {
            name => 'Log::Any-no_adapter-1mil_is_trace' ,
            perl_cmdline_template => ['-MLog::Any', '-e', 'my $log = Log::Any->get_logger; for(1..1_000_000) { $log->is_trace }'],
        },
        {
            name => 'Log::Any-null_adapter-1mil_log_trace',
            perl_cmdline_template => ['-MLog::Any', '-MLog::Any::Adapter', '-e', 'Log::Any::Adapter->set(q[Null]); my $log = Log::Any->get_logger; for(1..1_000_000) { $log->trace(q[]) }'],
        },
        {
            name => 'Log::Any-null_adapter-1mil_is_trace' ,
            perl_cmdline_template => ['-MLog::Any', '-MLog::Any::Adapter', '-e', 'Log::Any::Adapter->set(q[Null]); my $log = Log::Any->get_logger; for(1..1_000_000) { $log->is_trace }'],
        },

        {
            name => 'Log::Log4perl-easy-1mil_trace' ,
            perl_cmdline_template => ['-MLog::Log4perl=:easy', '-e', 'Log::Log4perl->easy_init($ERROR); for(1..1_000_000) { TRACE "" }'],
        },

    ],
    precision => 6,
};

1;
# ABSTRACT:
