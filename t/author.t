use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('UsePerl');

subtest index => sub {
	$t
		->get_ok('/')
		->status_is(200)
	};

subtest brian => sub {
	$t
		->get_ok('/~brian_d_foy')
		->status_is(200)
		->content_like( qr/brian_d_foy/i );
	};

subtest pudge => sub {
	$t
		->get_ok( '/~pudge' )
		->status_is( 200 )
		->content_like( qr/pudge/i );
	};

done_testing();
