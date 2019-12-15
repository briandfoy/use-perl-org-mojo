package UsePerl::Controller::Main;
use Mojo::Base 'Mojolicious::Controller';

use feature qw(signatures);
no warnings qw(experimental::signatures);

# This action will render a template
sub index ($self) {
  # Render template "example/welcome.html.ep" with message
  $self->render(msg => 'The main index page');
}

1;
