use strict;
use warnings;
use feature qw/say/;

# ===========================================================================
## author: yudalang
## data: 2017.08.06

# ===========================================================================

use Memory::Usage;
my $mu = Memory::Usage->new();
$mu->record('starting work');
# ---------------------------------------------------------------------------

 
my $x = " " x 1024;
$x .= $x for 1..6;
say length $x;
# my real code
 



# ---------------------------------------------------------------------------
$mu->record('after creating variable');
$mu->dump();
say "Values in the report are in kb.
vsz = virtual memory size, rss = resident set size, shared = shared memory size, code = text (aka code or exe) size, data = data and stack size !
";






################################################################################
#
# subroutes here
#
################################################################################

