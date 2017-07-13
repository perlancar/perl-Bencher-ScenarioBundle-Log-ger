#!perl
#
# Test old Log::Any->set_adapter API
#
use strict;
use warnings;
use Test::More tests => 2;

use Log::Any qw($log), proxy_class => 'Test';
Log::Any->set_adapter('Test', dummy_param => 1);
$log->error("bleah");
$log->contains_ok( qr/bleah/ );
is ( $log->adapter->{dummy_param}, 1, "adapter parameters set" );
