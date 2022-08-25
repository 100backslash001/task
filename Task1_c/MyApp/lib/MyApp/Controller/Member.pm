package MyApp::Controller::Member;
use Moose;
use namespace::autoclean;
use MyApp::Form::User;

BEGIN { extends 'Catalyst::Controller'; }

has 'form' => (
    isa => 'MyApp::Form::User',
    is => 'rw',
    lazy => 1,
    default => sub { MyApp::Form::User->new },
);

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched MyApp::Controller::Member in Member.');
}

# sub about :Local :Args(0) {
#     my ($self, $c) = @_;

#     $c->detach($c->view("HTML"));
# }

sub create :Local {
    my ($self, $c, $user_id) = @_;

    if ($c->user_exists) { $c->res->redirect($c->uri_for_action('/index')) }

    $c->stash(template => 'member/create.tt', form => $self->form);

    return unless $self->form->process(
        item_id => $user_id,
        params => $c->req->parameters,
        schema => $c->model('Site')->schema,
    );

    $c->res->redirect($c->uri_for_action('/index'));
}

__PACKAGE__->meta->make_immutable;

1;
