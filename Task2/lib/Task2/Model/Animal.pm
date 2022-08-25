package Task2::Model::Animal;
use Moose;
use namespace::autoclean;

extends 'Catalyst::Model';

has 'name' => (
	is     => 'rw',
	isa    => 'Str',
	reader => 'get_name',
	writer => 'set_name',
);

has 'wool' => (
	is  => 'ro',
	isa => 'Str',
);

has 'detachment' => (
	is  => 'ro',
        isa => 'Str',	
);

has 'gender' => (
	is     => 'ro',
	isa    => 'Str',
	reader => 'get_gender',
);

sub make_sound {
	return "Sound!";
}

sub eat {
	my $self = shift;
	
	if ( $self->detachment eq "Carnivorous" ) {
		return "eating meat";
	}
	elsif ( $self->detachment eq "Herbivore" ) {
		return "eating plant";
	}
	else {
		return "eating what was found";
	}
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
