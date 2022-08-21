package Task1_a;
use Mojo::Base 'Mojolicious', -signatures;

# This method will run once at server start
sub startup ($self) {

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig');

  # Configure the application
  $self->secrets($config->{secrets});

  $self->plugin('TemplateToolkit');
  $self->renderer->default_handler('tt2');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('Array_sort#array_sort');
}

1;
