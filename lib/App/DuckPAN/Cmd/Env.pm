package App::DuckPAN::Cmd::Env;
# ABSTRACT: Get or set ENV variables for the plugins

use Moo;
extends 'App::DuckPAN::Env';

with qw( App::DuckPAN::Cmd );

sub run {
  my ( $self, $name, $value ) = @_;

  if (!defined $name) {
    $self->show_usage;
  }
  $name = uc($name);
  if (defined $value) {
    if ($name eq 'RM') {
      $self->rm_env($value);
    } else {
      $self->set_env($name,$value);
    }
  } else {
    $self->show_env($name);
  }
  exit 0;
}

1;
