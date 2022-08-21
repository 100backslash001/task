package Task1_a::Model::Array_sorter;
use Modern::Perl;

sub bubble_sort {
    my @array = @_;

    foreach my $i (0..scalar(@array)) {
        foreach my $j (0..scalar(@array) - $i - 1) {
            if($array[$j] > $array[$j + 1]) {
                my $temp = $array[$j];
                $array[$j] = $array[$j + 1];
                $array[$j + 1] = $temp;
            }
        }
    }

    return @array;
}

sub binary_search {

    my ($element, @arr) = @_;

    my $min = 0;
    my $max = @arr - 1;

    while($min <= $max) {
        my $middle = int(($max + $min) / 2);

        if($element < $arr[$middle]) {
            $max = $middle - 1;
            next;
        }
        if($element > $arr[$middle]) {
            $min = $middle + 1;
            next;
        }
        return $middle;
    }

    return 0;
}

1;
