#!/usr/bin/perl

use  HTTP::Request::Common qw(POST);
use LWP::UserAgent;
use strict;
use warnings;

my $userAgent = LWP::UserAgent->new;

print "Nº de veces a votar: ";
my $n = <STDIN>;
chomp $n;

if ($n =~ /\D/ ) {
	print "\nOps, es necesario que introduzcas un número mayor que 0. Bye!\n\n";
	exit;
}

print "\nOk, empezamos...\n\n";

# EJEMPLO DE FILTRO POR COOKIE O SIN FILTRO
 my $voto = POST 'https://demos4.softaculous.com/Advanced_Poll/demo_1.php',[option_id => '6',x => '70', y => '22', action => 'vote', poll_ident => '2'];
###########################################

# EJEMPLO DE FILTRO POR IP ################
# my $voto = POST 'https://livedemo.installatron.com/1524339845advancedpoll/index.php',[action => 'vote', option_id => '7', poll_ident => '1'];
###########################################

print $userAgent->request($voto)->as_string;

for (my $i=1; $i <= $n; $i++) {			  
	print $userAgent->request($voto)->as_string . "\n\n Ya se ha votado " . $i . " veces ;) \n\n";
	#sleep(int(rand(2)));
	#system("anonsurf change");
}

print "Cerrando!\n\n";
