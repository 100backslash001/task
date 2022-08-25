package Task2::Controller::Root;
use Moose;
use namespace::autoclean;
use DDP;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

Task2::Controller::Root - Root Controller for Task2

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $cat = $c->model('Cat')->new(
       name       => 'John',
	   wool       => 'Smooth',
	   detachment => 'Carnivorous',
	   gender     => 'male',
    );

    $c->res->body(
        "Main class: " . $cat->get_package_name . ";"
        . "<br> What class can do: " . $cat->make_sound . "."
        . "<br> Its gender is: " . $cat->get_gender . "."
        . "<br> " . $cat->get_name . " is " . $cat->eat . "."
    );
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

tr0th,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
