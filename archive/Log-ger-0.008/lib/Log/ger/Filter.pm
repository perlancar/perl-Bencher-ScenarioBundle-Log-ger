package Log::ger::Filter;

our $DATE = '2017-06-26'; # DATE
our $VERSION = '0.008'; # VERSION

use parent 'Log::ger::Plugin';

1;
# ABSTRACT: Use a filter plugin

__END__

=pod

=encoding UTF-8

=head1 NAME

Log::ger::Filter - Use a filter plugin

=head1 VERSION

version 0.008

=head1 SYNOPSIS

To set globally:

 use Log::ger::Filter;
 Log::ger::Filter->set('Foo');

or:

 use Log::ger::Filter 'Foo';

To set for current package only:

 use Log::ger::Filter;
 Log::ger::Filter->set_for_current_package('Foo');

=for Pod::Coverage ^(.+)$

=head1 SEE ALSO

L<Log::ger::Output>

L<Log::ger::Plugin>

L<Log::ger::Format>

=head1 AUTHOR

perlancar <perlancar@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by perlancar@cpan.org.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
