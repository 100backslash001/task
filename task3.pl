#!/usr/bin/perl
use Modern::Perl;
use POSIX qw/ strftime /;

my $datetime = strftime "%Y-%m-%d %H:%M:%S", localtime;

print $datetime . "\n";

my ($date, $time) = $datetime =~ m/ (\d{4}-\d{2}-\d{2}) 
									[\s|\D|\d]*? 
									(\d{2}:\d{2}:\d{2}) /x;

print "Date: " . $date . "\n";
print "Time: " . $time . "\n";

if ( defined $ARGV[0] && $ARGV[0] eq 'test' ) { &test_regex; }

# Remove subroutine placed below before production :-)

sub test_regex {
	my @samples = (
		"2022-08-25 20:06:57",
		"2022-08-2520:06:57",
		"2022-08-25W20:06:57",
		"2022-08-25W20:06:57W",
		"W2022-08-25W20:06:57W",
		"2022-08-25WWWW20:06:57",
		"2022-08-25||20:06:57",
		"2022-08-25()20:06:57",
		"2022-08-25<2015>20:06:57",
	);

	foreach my $item (@samples) {
		if ( $item =~ m/ (\d{4}-\d{2}-\d{2}) 
						 [\s|\D|\d]*? 
						 (\d{2}:\d{2}:\d{2})/x ) {
			print "Ok: Test passed!\n";
		}
		else {
			print "Not Ok: Test failed! At '$item'\n";
		}
	}
}