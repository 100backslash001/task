package Task2::Model::Cat;
use Moose;
use namespace::autoclean;

extends 'Catalyst::Model';
extends 'Task2::Model::Animal';

has 'breed' => (
	is     => 'ro',
	isa    => 'Str',
	reader => 'get_breed',
);

sub make_sound {
	my $self = shift;
	
	my $parent_meth = $self->SUPER::make_sound();
	return "Meow $parent_meth";
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
