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

sub get_package_name {
	return __PACKAGE__;
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
