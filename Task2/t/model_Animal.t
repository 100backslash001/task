use strict;
use warnings;
use Test::Spec;
use lib 'Task2/lib/';


BEGIN { use_ok 'Task2::Model::Animal' }

my $animal = Task2::Model::Animal->new( 
	name => 'Noom', 
	wool => 'smooth', 
	detachment => 'Carnivorous', 
	gender => 'female' );

describe 'Animal' => sub {
	describe 'should do' => sub {
		it "make_sound" => sub {
			is($animal->make_sound, "Sound!");
		};
		it "eat" => sub {
			is($animal->eat, "eating meat");
		};
	};
};

done_testing();