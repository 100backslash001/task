package Task1_b::Controller::Phonebook;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Task1_b::Controller::Phonebook - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS
    Methods in Phonebook.pm controller: index, create, edit, delete. 
=cut


=head2 index
    
=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my @contacts = $c->model('PhoneDB::Contact')->all;

    $c->stash(
      contacts => \@contacts,
      template => 'index.tt',
    );
}

sub create :Local {
    my ($self, $c) = @_;

    if ( $c->req->params->{name} && $c->req->params->{fname}
                                && $c->req->params->{phone} ) {
        $c->model('PhoneDB::Contact')->create({
            name  => $c->req->params->{name},
            fname => $c->req->params->{fname},
            phone => $c->req->params->{phone},
        });
        $c->res->redirect($c->uri_for_action('phonebook/index'));
    }
    else {
        $c->res->redirect($c->uri_for_action('phonebook/index'));
    }
}

sub edit :Local {
    my ($self, $c, $id) = @_;

    $c->stash(
      id => $id,
      template => 'edit.tt'
    );

    if($c->req->params->{name} && $c->req->params->{fname}
                               && $c->req->params->{phone}) {
        
      $c->model('PhoneDB::Contact')->find({ 'id' => $id })
                                   ->update({
                                     name  => $c->req->params->{name},
                                     fname => $c->req->params->{fname},
                                     phone => $c->req->params->{phone},
                                   });

      $c->res->redirect($c->uri_for_action('phonebook/index'));
    }
    else {
      return;
    }
}

sub delete :Local {
    my ($self, $c, $id) = @_;

    $c->model('PhoneDB::Contact')->find({ 'id' => $id })->delete;

    $c->res->redirect($c->uri_for_action('phonebook/index'));
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
