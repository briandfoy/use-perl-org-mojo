
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
	$r->get('/')                             ->to('main#index');
	$r->get('/about')                        ->to('main#about');

	$r->get('/authors')                      ->to('main#authors');
	$r->get('/journals')                     ->to('main#journals');
	$r->get('/stories')                      ->to('main#stories');

	$r->get('/~:author/')                    ->to('main#author');
	$r->get('/~:author/journal/:journal')    ->to('main#journal');
	$r->get('/article.pl')                   ->to('main#story');
	}

1;
