use strict;
use warnings;
use Test::More tests => 4;
use Log::Any::Test;
use Log::Any '$log', default_adapter => 'Null';

$log->err("this is an error") if $log->is_error;
$log->debugf( "this is a %s with a defined (%s) value and an %s value",
    "debug", [ 1, 2 ], undef )
  if $log->is_debug;
$log->debugf( "this is a %s value", ["multi\nline"] ) if $log->is_debug;
$log->contains_ok( qr/this is an error/, 'got error' );
$log->contains_ok(
    qr/this is a debug with a defined \(\[1,2\]\) value and an <undef> value/,
    'got debug' );
$log->contains_ok( qr/this is a \["multi\\nline"\] value/, 'got multi-line' );
$log->empty_ok();
