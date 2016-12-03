package LWP::UserAgent::Caching::Simple;

=head1 NAME

LWP::UserAgent::Caching::Simple - The first 'hard thing' made easy --- simple

=cut

our $VERSION = '0.01';

use strict;
use warnings;

use parent 'LWP::UserAgent::Caching';

use CHI;

=head1 SYNOPSIS

    use LWP::UserAgent::Caching::Simple;
    
    my $ua = LWP::UserAgent::Caching::Simple->new;
    
    my $resp = $ua->get( 'http://example.com/cached?' );

and maybe even something quick:

    # use a built-in default User-Agent for quick one timers
    
    use LWP::UserAgent::Caching::Simple qw(get_from_json);
    
    my $hashref = get_from_json ( 'http://example.com/cached?' );


=head1 DESCRIPTION

This is a simplified version of L<LWP::UserAgent::Caching::Simple> with sensible
defaults and less options. For more control and more options, please use that
module.

=cut

my $chi_cache = CHI->new(
    driver          => 'File',
    root_dir        => '/tmp/LWP_UserAgent_Caching',
    file_extension  => '.cache',
);

my $chi_cache_meta = CHI->new(
    driver          => 'File',
    root_dir        => '/tmp/LWP_UserAgent_Caching',
    file_extension  => '.cache',
    l1_cache        => {
        driver          => 'Memory',
        global          => 1,
        max_size        => 1024*1024
    }
);

sub new {
    my ( $class) = @_;
    
    my $self = $class->SUPER::new(
        cache           => $chi_cache,
        cache_meta      => $chi_cache_meta,
    );
}

1;