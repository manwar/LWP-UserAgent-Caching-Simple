use LWP::UserAgent::Caching::Simple qw/get_from_json/;

# $HTTP::Caching::DEBUG = 1;

my $data = get_from_json(shift);

use Data::Dumper;
print Dumper $data;
