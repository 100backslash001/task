use Test::Spec;
use Array::Compare;
use lib 'task1_a/lib/';
use Package::Alias Array_sorter => 'Task1_a::Model::Array_sorter';

describe "Array_sorter" => sub {

	my $compare;

	before each => sub {
		$compare = Array::Compare->new;
	};

	describe "buble_sort" => sub {
		it "sorted array" => sub {
			is($compare->compare(Array_sorter::bubble_sort( [ 3, 2, 1 ] ), [ 1, 2, 3 ]), '1');
			is($compare->compare(Array_sorter::bubble_sort( [ 1, 2, 3 ] ), [ 1, 2, 3 ]), '1');
			is($compare->compare(Array_sorter::bubble_sort( [ 2, 0, -1, 2, 1 ] ), [ -1, 0, 1, 2, 2 ]), '1');
			is($compare->compare(Array_sorter::bubble_sort( [ 1 ] ), [ 1 ]), '1');

			is($compare->compare([ reverse @{Array_sorter::bubble_sort( [ 3, 2, 1 ] )} ], [ 3, 2, 1 ]), '1');
			is($compare->compare([ reverse @{Array_sorter::bubble_sort( [ 10, 7, 5, 0 ] )} ], [ 10, 7, 5, 0 ]), '1');
		};
	};

	describe "binary_search" => sub {
		it "found requested element" => sub {
			is(Array_sorter::binary_search( [ 1, 1, 1 ], 1 ), "MATCHED");
			is(Array_sorter::binary_search( [ 5, 6, 7, 8, 9 ], 5 ), "MATCHED");
			is(Array_sorter::binary_search( [ 5, 6, 7, 8, 9 ], 6 ), "MATCHED");
			is(Array_sorter::binary_search( [ 5, 6, 7, 8, 9 ], 7 ), "MATCHED");
			is(Array_sorter::binary_search( [ 5, 6, 7, 8, 9 ], 8 ), "MATCHED");
			is(Array_sorter::binary_search( [ 5, 6, 7, 8, 9 ], 9 ), "MATCHED");
			is(Array_sorter::binary_search( [ "A", "B", "C" ], "A" ), "MATCHED");
			is(Array_sorter::binary_search( [ "A", "B", "C" ], "B" ), "MATCHED");
			is(Array_sorter::binary_search( [ "A", "B", "C" ], "C" ), "MATCHED");
			is(Array_sorter::binary_search( [ ",", "!", "/" ], "!" ), "MATCHED");
			is(Array_sorter::binary_search( [ ",", "!", "/" ], "/" ), "MATCHED");
		};

		it "should not found requested element" => sub {
			is(Array_sorter::binary_search( [ 1, 1, 1 ], 2 ), "NOT MATCHED");
			is(Array_sorter::binary_search( [ 5, 6, 7, 8, 9 ], 2 ), "NOT MATCHED");
			is(Array_sorter::binary_search( [ 5, 6, 7, 8, 9 ], 3 ), "NOT MATCHED");
			is(Array_sorter::binary_search( [ 5, 6, 7, 8, 9 ], 4 ), "NOT MATCHED");
			is(Array_sorter::binary_search( [ 5, 6, 7, 8, 9 ], 1 ), "NOT MATCHED");
			is(Array_sorter::binary_search( [ 5, 6, 7, 8, 9 ], "A" ), "NOT MATCHED");
			is(Array_sorter::binary_search( [ "A", "B", "C" ], 1 ), "NOT MATCHED");
			is(Array_sorter::binary_search( [ "A", "B", "C" ], "F" ), "NOT MATCHED");
			is(Array_sorter::binary_search( [ "A", "B", "C" ], 1 ), "NOT MATCHED");
			is(Array_sorter::binary_search( [ ",", "!", "/" ], ">" ), "NOT MATCHED");
			is(Array_sorter::binary_search( [ ",", "!", "/" ], 2 ), "NOT MATCHED");
		};
	};
};

runtests unless caller;