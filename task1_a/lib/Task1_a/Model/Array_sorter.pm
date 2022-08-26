package Task1_a::Model::Array_sorter;
use POSIX;
use Modern::Perl;

sub bubble_sort {
    my @array = @_;

    foreach my $i (0..scalar(@array) - 1) {
        foreach my $j (0..scalar(@array) - 1 - $i - 1) {
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

    my ($arr, $element) = @_;
    my ($min, $max) = ( 0, @$arr - 1 );

    while($min <= $max) {
        my $middle = int( ($min + $max) / 2 );

        $min = $middle + 1, next if $arr->[$middle] lt $element;
        $max = $middle - 1, next if $arr->[$middle] gt $element;

        return "MATCHED";
    }

    return "NOT MATCHED";
}

1;
