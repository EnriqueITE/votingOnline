#!/usr/bin/perl

# Author: Enrique Serrano ( @EnriqueITE | hello@enriqueite.com )

use  HTTP::Request::Common qw(POST);
use LWP::UserAgent;
use strict;
use warnings;

my $userAgent = LWP::UserAgent->new;

print "How many times you want to vote?: ";
my $n = <STDIN>;
chomp $n;

if ($n =~ /\D/ ) {
	print "\nOps, please enter a number greater than 0. Bye!\n\n";
	exit;
}

print "\nOk, starting...\n\n";

# CONFIGURE
 my $voto = POST 'URL',[POSTFIELD_1 => 'WHATEVER',POSTFIELD_2 => 'WHATEVER', POSTFIELD_N => 'WHATEVER'];
###########

print $userAgent->request($voto)->as_string;

for (my $i=1; $i <= $n; $i++) {			  
	print $userAgent->request($voto)->as_string . "\n\n Voted " . $i . " times ;) \n\n";
	#sleep(int(rand(2))); # Sometimes it is recommended to add this random waiting time...
	#system("anonsurf change"); # Changing TOR nodes... ;) It is necessary to have anonsurf installed. It can be turned on with 'anonsurf start' and turned off with 'anonsurf stop'.
}

print "Bye!\n\n";
