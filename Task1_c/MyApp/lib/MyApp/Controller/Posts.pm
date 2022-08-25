package MyApp::Controller::Posts;
use Moose;
use namespace::autoclean;
use MyApp::Form::Post;

BEGIN { extends 'Catalyst::Controller'; }

has 'form' => (
    isa => 'MyApp::Form::Post',
    is => 'rw',
    lazy => 1,
    default => sub { MyApp::Form::Post->new },
);

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    if (!$c->user_exists) { $c->res->redirect($c->uri_for_action('/index')) }

    my @posts = $c->model('Site::Post')->all;

    $c->stash(
        title => 'Posts page',
        posts => \@posts,
        template => 'posts/get_posts.tt',
    );
}

sub create :Local {
    my ($self, $c, $post_id) = @_;

    $c->stash(template => 'posts/create_post.tt', form => $self->form);

    return unless $self->form->process(
        item_id => $post_id,
        params => $c->req->parameters,
        schema => $c->model('Site')->schema,
    );

    $c->res->redirect($c->uri_for_action('/posts/index'));
}

sub edit :Local {
    my ($self, $c, $post_id) = @_;

    $c->stash(
        post_id => $post_id,
        template => 'posts/edit_post.tt',
    );

    if ($c->req->params->{edited} && $c->req->params->{edited_title}) {
        $c->model('Site::Post')->find({'id' => $post_id})
                               ->update({
                                    'text' => $c->req->params->{edited},
                                    'title' => $c->req->params->{edited_title},
                                });
        $c->res->redirect($c->uri_for_action('/posts/index'));
    }
    else {
        return;
    }
}

sub delete :Local {
    my ($self, $c, $post_id) = @_;

    $c->model('Site::Post')->find({ id => $post_id })->delete;
    $c->res->redirect($c->uri_for_action('/posts/index'));
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
