use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('UsePerl');
my $pattern = qr/\Quse.perl.org/i;

subtest index => sub {
	$t
		->get_ok('/')
		->status_is(200)
		->content_like( $pattern );
	};

subtest about => sub {
	$t
		->get_ok('/about')
		->status_is(200)
		->content_like( qr/About/i );
	};

subtest authors => sub {
	$t
		->get_ok( '/authors' )
		->status_is( 200 )
		->content_like( $pattern );
	};

subtest stories => sub {
	$t
		->get_ok( '/stories' )
		->status_is( 200 )
		->content_like( $pattern );
	};

subtest journals => sub {
	$t
		->get_ok( '/journals' )
		->status_is( 200 )
		->content_like( $pattern );
	};

done_testing();
