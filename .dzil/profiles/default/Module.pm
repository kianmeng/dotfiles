package {{$name}};
# ABSTRACT: Perl library for

use namespace::clean;
use strictures 2;

our $VERSION = '0.01';


1;
__END__

=encoding utf-8

=head1 NAME

{{$name}} - A Perl module.

=head1 SYNOPSIS

    use {{$name}};

    my $client = {{$name}}->new();

=head1 DESCRIPTION

{{$name}} is a .

=head1 DEVELOPMENT

Source repository at L<https://github.com/kianmeng/{{lc $dist->name}}|https://github.com/kianmeng/{{lc $dist->name}}>.

How to contribute? Follow through the L<CONTRIBUTING.md|https://github.com/kianmeng/{{lc $dist->name}}/blob/master/CONTRIBUTING.md> document to setup your development environment.

=head1 METHODS

=head2 new()

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2019 Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

=head1 AUTHOR

Kian Meng, Ang E<lt>kianmeng@users.noreply.github.comE<gt>

=head1 SEE ALSO
