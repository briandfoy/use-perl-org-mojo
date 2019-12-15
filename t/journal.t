use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('UsePerl');
my $pattern = qr/\Quse.perl.org/i;

subtest index => sub {
	$t
		->get_ok('/')
		->status_is(200)
	};

subtest brian => sub {
	$t
		->get_ok('/~brian_d_foy/journal/123')
		->status_is(200)
		->content_like( qr/Author: \s+ brian_d_foy/x )
		->content_like( qr/Sid: \s+ 123/x )
		;
	};

subtest pudge => sub {
	$t
		->get_ok( '/~pudge/journal/500' )
		->status_is( 200 )
		->content_like( qr/Author: \s+ pudge/x )
		->content_like( qr/Sid: \s+ 500/x )
		;
	};

done_testing();
