package EdoWorld::Controller::item;
use strict;
use warnings;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use Catalyst qw/-Debug/;
BEGIN {extends 'Catalyst::Controller'; }

sub top :Local :Aargs{
  my($self,$c) = @_;
  $c->stash->{template} = 'item/top.tt';
}

sub list :Local :Args{
  my($self,$c) = @_;
  my $member_id = 1;
  my $members = $c->model('DB2::Member')->find($member_id);
  my $items = $self->select_item($c);
  #my $items = $c->model('DB2::Item')->search();
  #template
  $c->stash->{members}  = $members;
  $c->stash->{items}    = $items;
  $c->stash->{template} = 'item/list.tt';
}

sub buy_confirm :Local :Args{
  my ($self,$c,$args_1) = @_;

  my $member_id = 1;
  my $members = $c->model('DB2::Member')->find($member_id);
  my $item_id = $args_1;
  my $items = $self->find_item($c,$item_id);
  #template
  $c->stash->{members}  = $members;
  $c->stash->{items}    = $items;
  $c->stash->{template} = 'item/buy_confirm.tt';
}

sub buy_execute :Local :Args{
  my ($self,$c,$args_1) = @_;

  #member
  my $member_id = 1;
  my $members = $c->model('DB2::Member')->find($member_id);
  my $amount  = $members->amount;

  #item
  my $item_id = $args_1;
  #my $items = $self->find_item($c,$item_id);
  my $items = $c->model('DB2::Item')->find($item_id);
  my $item_price = $items->price;

  #money_check
  if($amount - $item_price < 0){
    #redirect
    $c->res->redirect($c->uri_for('/self/no_money'));
    return;
  }

  $self->insert_my_item($c,$items);
  $members->amount($amount - $item_price);
  $members->update();

  #template
  $c->stash->{members}  = $members;
  $c->stash->{items}    = $items;
  $c->stash->{template} = 'item/buy_execute.tt';
}

sub find_item :Private {
  my ($self,$c,$item_id) = @_;
  my $records = $c->model('DB2::Item')->find($item_id);
  return $records;
}

sub select_item :Private {
  my ($self,$c) = @_;
  my $records = $c->model('DB2::Item')->search();
  my @dataarray=();
  while(my $rec = $records->next){
    push(@dataarray,$rec);
  }
  return \@dataarray;
}

sub insert_my_item :Local{
  my($self,$c,$items) = @_;
  my $row = $c->model('DB2::MyItem')->create({
    member_id  => 1,
    map_id     => '',
    code       => '',
    genre_code => '',
    name       => 'AAA',
    price      => 1000,
    comment    => '',
  });
}

1;

