
package UsePerl;
use Mojo::Base 'Mojolicious';

use feature qw(signatures);
no warnings qw(experimental::signatures);

# This method will run once at server start
sub startup ($self) {
	# Load configuration from hash returned by "my_app.conf"
	my $config = $self->plugin('Config');

	# Router
	my $r = $self->routes;

	# Normal route to controller
	$r->get('/')->to('main#index');
	}

1;
