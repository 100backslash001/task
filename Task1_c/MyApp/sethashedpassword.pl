#!/usr/bin/perl

use strict;
use warnings;
use MyApp::Schema;

my $schema = MyApp::Schema->connect('dbi:mysql:site', 'root', 'root');
my @users = $schema->resultset('User')->all;

foreach my $user (@users) {
	$user->password('password');
	$user->update;
}