package Task1_a::Controller::Array_sort;
use Mojo::Base 'Mojolicious::Controller', -signatures;
use Task1_a::Model::Array_sorter;

# This action will render a template
sub array_sort ($c) {
  my @unsorted = qw/ 7 1 3 4 2 4 6 5 5 /;

  my @sorted = Task1_a::Model::Array_sorter::bubble_sort(@unsorted);
  my $element = $c->req->param('value');
  my $matched = Task1_a::Model::Array_sorter::binary_search($element, @sorted);

  $c->stash(
    element  => $element,
    matched  => $matched,
    unsorted => \@unsorted,
    sorted   => \@sorted,
  );
  $c->render(template => 'example/index');
}

1;
