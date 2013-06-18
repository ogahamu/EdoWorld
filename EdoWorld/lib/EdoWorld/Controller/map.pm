package EdoWorld::Controller::map;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

EdoWorld::Controller::map - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched EdoWorld::Controller::map in map.');
}

sub list :Local :Aargs {
  my ($self,$c) = @_;

  
  #$c->stash->{template}->'map/list.tt';
}


sub select_my_construction :Private {
  my ($self,$c,$genre_code,$page) = @_;
  #$page = 1 unless $page;
  #$genre_code = 1 unless $genre_code;
  my $records = $c->model('DB2::MyConstruction')->search();
  my @dataarray=();
  while(my $rec = $records->next){
    push(@dataarray,$rec);
  }
  return \@dataarray;
}

=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
