use strict;
use warnings;
use Time::HiRes qw[gettimeofday tv_interval];

my $time1=[gettimeofday()];

sub qsort (\@) {_qsort($_[0], 0, $#{$_[0]})}

sub _qsort {
    my ($lista, $esq, $dir) = @_;
    if ($esq < $dir) {
        my $mid = partition($lista, $esq, $dir);
        _qsort($lista, $esq,     $mid - 1);
        _qsort($lista, $mid + 1, $dir   );
    }
}

sub partition {
    my ($lista, $esq, $dir) = @_;
    my $x = $$lista[$dir];
    my $i = $esq - 1;
    for my $j ($esq .. $dir - 1) {
        if ($$lista[$j] <= $x) {
            $i++;
            @$lista[$i, $j] = @$lista[$j, $i];
        }
    }
    $i++;
    @$lista[$i, $dir] = @$lista[$dir, $i];
    return $i;
}

my @lista = (4, 3, 9, 2, 1, 7, 5, 8);
qsort @lista;


my $milliseconds = tv_interval($time1)*1000;

print $milliseconds;
print "s\n";


#print "@lista\n"; # 1 2 3 4 5 7 8 9