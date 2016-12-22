requires "LWP::UserAgent::Caching" => "0.03";

require "JSON"              => "0";
require "CHI"               => "0";
require "HTTP::Request"     => "0";

on "test" => sub {
    require "Test::Most"        => "0";
    require "Test::MockObject"  => "0";
}
