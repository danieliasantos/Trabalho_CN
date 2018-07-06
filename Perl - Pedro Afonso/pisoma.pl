#!/Strawberry/perl/bin

use Math::Trig;
use Time::HiRes qw[gettimeofday tv_interval];

my $time1=[gettimeofday()];

my $soma = 0;

for(my $j =1;$j<=500;$j++){
    for(my $k=1;$k<=10000;$k++){

        $soma+= 1/ ($k*$k);
    }


}


my $milliseconds = tv_interval($time1);


print $milliseconds;
print "s\n";