package Dist::Zilla::App::Command::debuild;
BEGIN {
  $Dist::Zilla::App::Command::debuild::VERSION = '0.01';
}

use strict;
use warnings;

# ABSTRACT: build debian package


use Dist::Zilla::App -command;
use autodie qw(:all);

sub abstract { 'build debian package' }

sub opt_spec {}

sub execute {
    my ($self, $opt, $args) = @_;

    system('rm -rf debuild');
    mkdir('debuild');
    $self->zilla->build_in('debuild/source');
    system('cd debuild/source && debuild');
}

1;

__END__
=pod

=head1 NAME

Dist::Zilla::App::Command::debuild - build debian package

=head1 VERSION

version 0.01

=head1 DESCRIPTION

This command builds sources using dzil and runs debuild on them.

Sources are kept in 'debuild/source'.

=head1 AUTHOR

Vyacheslav Matyukhin <mmcleric@yandex-team.ru>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Yandex LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

