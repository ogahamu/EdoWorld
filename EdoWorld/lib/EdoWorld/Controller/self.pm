package EdoWorld::Controller::self;
use strict;
use warnings;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use Catalyst qw/-Debug/;
BEGIN {extends 'Catalyst::Controller'; }


use EdoWorld::Common::Session;

sub index :Local {
  my ( $self, $c ) = @_;

  my $member_id = EdoWorld::Common::Session::get_member_id($c);

  my $member       = $self->select_member($c,$member_id);
  my $nick_name    = $member->nick_name;
  my $mail_address = $member->mail_address;
  my $amount       = $member->amount;
  #$c->response->body("hoge1");
  #$c->response->body("nick_name".$nick_name." amount".$amount);

  #$c->session->{member_id}=1255;
  $c->stash->{member_name} = $nick_name;
  $c->stash->{amount}      = $amount;
  $c->stash->{template} = 'self/index.tt';
}

sub change_info :Local{
  my($self,$c)=@_;

  my $member_id = EdoWorld::Common::Session::get_member_id($c);
  #my $members = $self->select_member($c,$member_id);
  my $members = $c->model('DB2::Member')->find($member_id);

  #template
  $c->stash->{members}  = $members;
  $c->stash->{template} = 'self/change_info.tt';
}

sub change_info_execute :Local{
  my($self,$c)=@_;
  my $member_id = EdoWorld::Common::Session::get_member_id($c);

  my $nick_name    = $c->req->param('nick_name');
  my $mail_address = $c->req->param('mail_address');

  #update
  my $members = $c->model('DB2::Member')->find($member_id);
  $members->nick_name($nick_name);
  $members->mail_address($mail_address);
  $members->update();

  #template
  $c->stash->{members}  = $members;
  $c->stash->{template} = 'self/change_info_execute.tt';
}

sub no_money :Local :Args {
  my ($self,$c) = @_;
  $c->stash->{template} = 'self/no_money.tt';
}

sub own_bank : Local :Args {
  my($self,$c)=@_;

  my $member_id = EdoWorld::Common::Session::get_member_id($c);
  #my $members = $self->select_member($c,$member_id);
  my $members = $c->model('DB2::Member')->find($member_id);
  #template
  $c->stash->{members} = $members;
  $c->stash->{template} = 'self/own_bank.tt';
}

sub move_money :Local :Args {
  my($self,$c)=@_;

  my $member_id = 1;
  my $members = $c->model('DB2::Member')->find($member_id);

  my $amount = $members->amount;
  my $bank_amount = $members->bank_amount;

  my $update_amount = $amount + $bank_amount;

  $members->amount($update_amount);
  $members->bank_amount(0);
  $members->update();
  #template
  $c->stash->{template} = 'self/move_money.tt';
}


sub accept_money :Local :Args {
  my ($self,$c)=@_;
  $c->stash->{template} = 'self/acc';
}

sub own_item :Local{
  my ($self,$c) = @_;
  my $member_id = EdoWorld::Common::Session::get_member_id($c);
  my $item_list = $self->select_my_item($c,$member_id);
  $c->stash->{item_list} = $item_list;
  $c->stash->{template} = 'self/own_item.tt';
}

sub own_construction :Local{
  my ($self,$c) = @_;
  $c->stash->{template} = 'self/own_construction.tt';
}

sub buy_confirm :Local :Args{
  my ($self,$c,$args_1) = @_;
  my $member_id = EdoWorld::Common::Session::get_member_id($c);
  my $item_id = $args_1;
  my $item_data = $self->find_item($c,$item_id);
  $c->stash->{item_data} = $item_data;
  $c->stash->{template} = 'self/buy_confirm.tt';
}

sub buy_execute :Local :Args{
  my ($self,$c,$args_1) = @_;
  my $member_id = EdoWorld::Common::Session::get_member_id($c);
  my $item_id = $args_1;
  my $item_data = $self->find_item($c,$item_id);


  #$self->insert_my_item($c,$item_data);

  $c->stash->{item_data} = $item_data;
  $c->stash->{template} = 'self/buy_execute.tt';
}


sub regist_execute :Local{
  my($self,$c) = @_;
}

sub select_member :Private{
  my($self,$c,$member_id) = @_;
  return $c->model('DB2::Member')->find($member_id);
}

sub select_member_by_ssid :Private{
  my($self,$c,$ssid) = @_;
  return $c->model('DB2::Member')->search({
    ssid => $ssid,
  });
}

sub return_nick_name :Private{
  my($self,$c,$num) = @_;
  my $data = $c->model('DB2::Member')->find(1);
  return $data->nick_name;
}

sub return_members :Private{
  my($self,$c,$num) = @_;
  my $page = 1;
  my $records = $c->model('DB2::Member')->search({id=>{'>='=>'1'}});
  my @dataarray=();
  while(my $rec = $records->next){
    push(@dataarray,$rec);
  }
  return \@dataarray;
}

sub find_my_item :Private {
  my ($self,$c,$item_id) = @_;
  my $records = $c->model('DB2::MyItem')->find($item_id);
  return $records;
}

sub select_my_item :Private {
  my ($self,$c,$member_id,$genre_code,$page) = @_;
  #$page = 1 unless $page;
  #$genre_code = 1 unless $genre_code;
  my $records = $c->model('DB2::MyItem')->search(
    {
      member_id => 1,
    }
  );
  my @dataarray=();
  while(my $rec = $records->next){
    push(@dataarray,$rec);
  }
  return \@dataarray;
}

sub insert_my_item :Local {
  my ($self,$c,$opts) = @_;

  my $id         = 1;
  my $member_id  = 1;
  my $code       = "";
  my $genre_code = "";
  my $name       = "hoge";
  my $price      = "";
  my $comment    = "";

  my $row = $c->model('DB2::Member')->create({
    id         => $id,
    member_id  => $member_id,
    code       => $code,
    genre_code => $genre_code,
    name       => $name,
    price      => $price,
    comment    => $comment
  });

  return 1;
}

sub find_item :Private {
  my ($self,$c,$item_id) = @_;
  my $records = $c->model('DB2::Item')->find($item_id);
  #my $records = $c->model('DB2::Item')->search(
  #  {id => 1}
  #);
  return $records;
}

sub select_item :Private {
  my ($self,$c,$genre_code,$page) = @_;
  #$page = 1 unless $page;
  #$genre_code = 1 unless $genre_code;
  my $records = $c->model('DB2::Item')->search(
    {
      id => 1,
    }
  );
  my @dataarray=();
  while(my $rec = $records->next){
    push(@dataarray,$rec);
  }
  return \@dataarray;
}








sub select_page :Private {
  my ($self,$c,$genre_code,$page) = @_;
  $page = 1 unless $page;
  $genre_code = 1 unless $genre_code;
  my $records = $c->model('DB2::Member')->search(undef,{order_by=>{-desc=>['nick_name','id']},rows=>2,page=>$page});
  my @array;
  while(my $rec = $records->next){
    push(@array,$rec);
  }
  return \@array;
}

=pod
| id           | int(11)      | NO   | PRI | NULL    |       |
| ssid         | int(11)      | YES  |     | NULL    |       |
| nick_name    | varchar(250) | YES  |     | NULL    |       |
| pass_word    | varchar(250) | YES  |     | NULL    |       |
| mail_address | varchar(250) | YES  |     | NULL    |       |
| amount       | int(11)      | YES  |     | NULL    |       |
| created_at   | datetime     | YES  |     | NULL    |       |
| update_at    | datetime     | YES  |     | NULL    |       |
=cut

sub insert_member :Local {
  my ($self,$c,$opts) = @_;

  my $id           = 1;
  my $ssid         = 1;
  my $pass_word    = "";
  my $mail_address = "";
  my $amount       = 0;
  my $created_at   = "";

  my $row = $c->model('DB2::Member')->create({
    id           => $id,
    ssid         => $ssid,
    pass_word    => $pass_word,
    mail_address => "",
    amount       => 0,
    crated_at    => ""
  });

  return 1;
}


=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;

