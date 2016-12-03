use LWP::UserAgent::Caching::Simple;

my $ua = LWP::UserAgent::Caching::Simple->new( );

# $HTTP::Caching::DEBUG = 1;

my $method  = shift;
my $url     = shift;

if ($method =~ /^GET$/i ) {
print "\n#####\n";
print "\nGETTING\n";
print "\n#####\n";


    my $resp = $ua->get($url);
    print $resp->headers->as_string;
    exit
}

my $http_request = HTTP::Request->new( $method, $url );

my $http_response = $ua->request($http_request);

print $http_response->headers->as_string;