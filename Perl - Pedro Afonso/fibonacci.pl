#!/Strawberry/perl/bin

use Time::HiRes qw[gettimeofday tv_interval];

my $time1=[gettimeofday()];

my $n = 20; 
my $a = 0; 
my $b = 1; 
my $aux = 0;

for (my $i = 0; $i<= $n; $i++){
    
    $aux = $a;
    $a = $a + $b;
    $b = $aux;

}


#print "$a";

my $milliseconds = tv_interval($time1)*1000;


print $milliseconds;
print "s\n";