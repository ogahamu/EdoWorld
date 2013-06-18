package EdoWorld::Controller::my_item;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

EdoWorld::Controller::my_item - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
  my ( $self, $c ) = @_;
  $c->response->body('Matched EdoWorld::Controller::my_item in my_item.');
}

sub top :Local :Aargs{
  my($self,$c) = @_;
  $c->stash->{template} = 'my_item/top.tt';
}

sub list :Local :Args{
  my($self,$c) = @_;
  my $member_id = 1;
  my $my_items = $self->select_my_item($c,$member_id);
  $c->stash->{my_items} = $my_items;
  $c->stash->{template} = 'my_item/list.tt';
}

sub use_confirm :Local :Args {
  my ($self,$c,$my_item_id) = @_;
  
  my $my_items = $c->model('DB2::MyItem')->find($my_item_id);
   
  $c->stash->{my_items} = $my_items;
  $c->stash->{template} = 'my_item/use_confirm';
}

sub use_execute :Local :Args {
  my ($self,$c,$my_item_id) = @_;

  my $member_id = 1;
  my $my_items = $c->model('DB2::MyItem')->find($my_item_id);
  my $genre_code = $my_items->genre_code;

  if($genre_code eq 1){
    $self->power_up($c,$member_id,100);
  }
  if($genre_code eq 2){
    $self->speed_up($c,$member_id,100);
  }

  $self->down_item_available_flag($c,$my_item_id);


  $c->stash->{template} = 'my_item/use_execute';
}

sub power_up :Private {
  my ($self,$c,$member_id,$up_power) = @_;
  my $members = $c->model('DB2::Member')->find($member_id);

  #update
  my $power = $members->power;
  my $max_power = $members->max_power;
  my $update_power = $power + $up_power;

  $update_power = $max_power if $update_power > $max_power;
  $members->power($update_power);
  $members->update();

  return 1;
}

sub speed_up :Private {
  my ($self,$c,$member_id,$up_speed) = @_;
  my $members = $c->model('DB2::Member')->find($member_id);

  #update
  my $speed        = $members->speed;
  my $max_speed    = $members->max_speed;
  my $update_speed = $speed + $up_speed;

  $update_speed    = $max_speed if ($update_speed > $max_speed);
  $members->power($update_speed);
  $members->update();

  return 1;
}

sub down_item_available_flag :Private {
  my($self,$c,$item_id) = @_;

  my $my_items = $c->model('DB2::MyItem')->find($item_id);

  my $available_flag = $my_items->available_flag;
  print "error" if $available_flag eq 0;

  $my_items->available_flag(0);
  $my_items->update();

  return 1;
}

sub select_member :Private{
  my($self,$c,$member_id) = @_;
  return $c->model('DB2::Member')->find($member_id);
}

sub find_my_item :Private {
  my ($self,$c,$item_id) = @_;
  my $records = $c->model('DB2::MyItem')->find($item_id);
  #my $records = $c->model('DB2::Item')->search(
  #  {id => 1}
  #);
  return $records;
}

sub select_my_item :Private {
  my ($self,$c,$genre_code,$page) = @_;
  my $records = $c->model('DB2::MyItem')->search();
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
