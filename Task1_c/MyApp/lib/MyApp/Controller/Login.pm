package MyApp::Controller::Login;
use Moose;
use namespace::autoclean;
use Data::Dumper;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyApp::Controller::Login - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    if ($c->user_exists) { $c->res->redirect($c->uri_for_action('/index')) }

    my $login = $c->req->params->{login};
    my $password = $c->req->params->{password};

    if ($login && $password) {
        if ($c->authenticate({ login => $login, password => $password, })) {
            $c->res->redirect($c->uri_for_action('/index'));
            return;
        }
        else {
            $c->stash(err_msg => "Bad login or password.");
        }
    }
    else {
        $c->stash(err_msg => "Empty login or password")
            unless ($c->user_exists);
    }

    $c->stash(template => 'login/login.tt');
}



=encoding utf8

=head1 AUTHOR

tr0th,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
