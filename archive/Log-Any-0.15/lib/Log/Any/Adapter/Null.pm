package Log::Any::Adapter::Null;
{
  $Log::Any::Adapter::Null::VERSION = '0.15';
}
use Log::Any;
use strict;
use warnings;

sub new {
    my $class = shift;
    return bless {}, $class;
}

# Collect all logging and detection methods, including aliases and printf variants
#
my %aliases     = Log::Any->log_level_aliases;
my @alias_names = keys(%aliases);
my @all_methods = (
    Log::Any->logging_and_detection_methods(),
    @alias_names,
    ( map { "is_$_" } @alias_names ),
    ( map { $_ . "f" } ( Log::Any->logging_methods, @alias_names ) ),
);

# All methods are no-ops and return false
#
foreach my $method (@all_methods) {
    no strict 'refs';
    *{ __PACKAGE__ . "::$method" } = sub { return undef };
}

1;

__END__

=pod

=head1 NAME

Log::Any::Adapter::Null -- Discards all log messages

=head1 VERSION

version 0.15

=head1 SYNOPSIS

    Log::Any::Adapter->set('Null');

=head1 DESCRIPTION

This Log::Any adapter discards all log messages and returns false for all
detection methods (e.g. is_debug). This is the default adapter when Log::Any is
loaded.

=head1 SEE ALSO

L<Log::Any|Log::Any>, L<Log::Any::Adapter|Log::Any::Adapter>

=head1 AUTHOR

Jonathan Swartz

=head1 COPYRIGHT & LICENSE

Copyright (C) 2009 Jonathan Swartz, all rights reserved.

This program is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Jonathan Swartz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
