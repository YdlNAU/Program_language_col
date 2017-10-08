package AA;

use Sheep;

my $lost = bless { Name => 'Bo' , Color => 'white' } , 'Sheep';

print $lost -> {Name};

print "\n----------------------------\n";

my $tv_horse = Sheep -> named ('Mrs. white');
$tv_horse -> set_color( 'white-little-yellow');

print $tv_horse -> name,' is colored ', $tv_horse -> color, "\n";


print "\n----------------------------\n";
use Horse;

my ($package, $filename, $line) = Horse::cal;

print "$package\t$filename\t$line\n";



