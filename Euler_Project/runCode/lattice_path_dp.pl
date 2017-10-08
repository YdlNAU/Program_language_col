use strict;
use warnings;

# inspired by 
# http://www.mathblog.dk/project-euler-15/

my $grid_size=20;
# but the matrix of grids is 21 x 21

my @grid;

# Initialise the grid with boundary conditions

for (my $i = 0; $i< $grid_size; $i++){
  $grid[$i][$grid_size] = 1;
  $grid[$grid_size][$i] = 1;
}

for (my $i= $grid_size -1; $i>=0; $i--){
  for (my $j =$grid_size -1;$j>=0;$j--){
    $grid[$i][$j]=$grid[$i+1][$j]+$grid[$i][$j+1];

  }

}

print "$grid[0][0]\n";
