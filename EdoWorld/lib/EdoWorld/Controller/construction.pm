package EdoWorld::Controller::construction;
use strict;
use warnings;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use Catalyst qw/-Debug/;
BEGIN {extends 'Catalyst::Controller'; }

sub top :Local :Aargs{
  my($self,$c) = @_;
  $c->stash->{template} = 'construction/top.tt';
}

sub list :Local :Args{
  my($self,$c) = @_;

  my $member_id = 1;

  my $members = $c->model('DB2::Member')->find($member_id);
  my $nick_name    = $members->nick_name;
  my $mail_address = $members->mail_address;
  my $amount       = $members->amount;

  my $construction_list = $self->select_construction($c,$member_id);

  $c->stash->{members} = $members;
  $c->stash->{list} = $construction_list;
  $c->stash->{template} = 'construction/list.tt';
}

sub buy_confirm :Local :Args{
  my ($self,$c,$args_1) = @_;
  my $member_id = 1;
  my $members = $c->model('DB2::Member')->find($member_id);

  my $construction_id = $args_1;
  my $constructions = $c->model('DB2::Construction')->find($construction_id);
  #my $constructions= $self->find_construction($c,$construction_id);

  $c->stash->{members} = $members;
  $c->stash->{constructions} = $constructions;
  $c->stash->{template} = 'construction/buy_confirm.tt';
}

sub buy_execute :Local :Args{
  my ($self,$c,$construction_id) = @_;
  my $member_id = 1;
  my $members = $c->model('DB2::Member')->find($member_id);

  my $constructions = $c->model('DB2::Construction')->find($construction_id);
  $self->pay_money($c,100);
  $self->insert_map_positions($c,$constructions);

  $c->stash->{members} = $members;
  $c->stash->{constructions} = $constructions;
  $c->stash->{template} = 'construction/buy_execute.tt';
}

sub pay_money :Local :Args{
  my ($self,$c,$price) = @_;

  my $member_id = 1;
  my $members = $c->model('DB2::Member')->find($member_id);
  my $amount = $members->amount;

  my $after_amount = $amount - $price;
  #return 0 if $after_amount < 0;

  #pay price
  #$members->title('amount');
  $members->amount($after_amount);
  $members->update();

  return 1;
}

sub insert_my_construction :Local{
  my($self,$c) = @_;
  my $row = $c->model('DB2::MyConstruction')->create({
    member_id  => 1,
    map_id     => '',
    code       => '',
    genre_code => '',
    name       => 'AAA',
    price      => 1000,
    comment    => ''
  });
}

sub insert_map_positions :Local{
  my($self,$c,$constructions) = @_;
  my $row = $c->model('DB2::MapPosition')->create({
    member_id      => 1,
    map_id         => 1,
    position_id    => '',
    position_code  => '',
    position_flag  => 0,
    fixed_at       => '',
    fixed_flag     => 0,
    create_at      => '',
    update_at      => '',
    item_id        => 1,
    item_name      => 'hoge',
  });
}

sub find_construction :Private {
  my ($self,$c,$construction_id) = @_;
  my $records = $c->model('DB2::Construction')->find($construction_id);
  #my $records = $c->model('DB2::Item')->search(
  #  {id => 1}
  #);
  return $records;
}

sub select_construction :Private {
  my ($self,$c,$genre_code,$page) = @_;
  my $records = $c->model('DB2::Construction')->search();
  my @dataarray=();
  while(my $rec = $records->next){
    push(@dataarray,$rec);
  }
  return \@dataarray;
}

1;

