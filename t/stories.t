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

subtest story => sub {
	$t
		->get_ok('/stories')
		->status_is(200)
		->content_like( qr/stories/i );
	};

done_testing();
