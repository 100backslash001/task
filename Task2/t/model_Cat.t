use strict;
use warnings;
use Test::Spec;
use lib 'Task2/lib';


BEGIN { use_ok 'Task2::Model::Cat' }

my $cat = Task2::Model::Cat->new( 
	name => 'Noom', 
	wool => 'smooth', 
	detachment => 'Herbivore', 
	gender => 'female' );

describe 'Cat' => sub {
	describe 'should do' => sub {
		it "make_sound" => sub {
			is($cat->make_sound, "Meow Sound!");
		};
		it "eat" => sub {
			is($cat->eat, "eating what was found");
		};
	};
};

done_testing();