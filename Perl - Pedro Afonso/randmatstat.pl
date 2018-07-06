#!/Strawberry/perl/bin

use Math::Trig;
use Time::HiRes qw[gettimeofday tv_interval];

my $time1=[gettimeofday()];

my @vzeros;
my @wzeros;
my @a;
my @b;
my @c;
my @d;

my $n = 5;
my $t = 1000;



for (my $i=0;$i<10;$i++){
    for(my $j=0; $j<10;$j++){
        $vzeros[$i][$j] = 0;
        $wzeros[$i][$j] = 0;
    }
}

for(my $h=1;$h<$t;$h++){


for(my $i=0;$i<$n;$i++){

    for(my $j=0;$j<$n;$j++){

$a[$i][$j] = int(rand(10));
$b[$i][$j] = int(rand(10));
$c[$i][$j] = int(rand(10));
$d[$i][$j] = int(rand(10));

    }

}

my @P;
my @Pt;

    $P[0] = @a;
    $P[1] = @b;
    $P[2] = @c;
    $P[3] = @d;

    $Pt[0][0] = @a;
    $Pt[1][0] = @b;
    $Pt[2][0] = @c;
    $Pt[3][0] = @d;

my @Q;
my @Qt;

    $Q[0][0]= @a;
    $Q[0][1]= @b;
    $Q[1][0]= @c;
    $Q[1][1]= @d;

    $Qt[0][0]= @a;
    $Qt[0][1]= @c;
    $Qt[1][0]= @b;
    $Qt[1][1]= @d;

  my @x = (@P * @Pt)^4;
  my @y = (@Q * @Qt)^4;

  @vzeros = $x[0][0] + $x[1][1];
  @wzeros = $y[0][0] + $y[1][1];


}

my @result1;
my @result2;

@result1 = @vzeros/ 4;
@result2 = @wzeros / 4;

my $milliseconds = tv_interval($time1);


print $milliseconds;
print "s\n";