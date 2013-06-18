package EdoWorld::Controller::login;
use Moose;
use namespace::autoclean;
use Data::Dumper;
BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

EdoWorld::Controller::login - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
  my ( $self, $c ) = @_;
  $c->stash->{template} = 'login/top.tt';
  #$c->response->body('Matched EdoWorld::Controller::login in login.');
}

sub logout :Local :Args {
  my ( $self,$c) = @_;
  $c->session->{member_id} = undef;
  $c->stash->{template} = 'login/logout';
}

sub top :Local :Args {
  my ($self,$c) = @_;
  $c->session->{member_id}=1255;
  $c->stash->{member_id} = 1112;
  $c->stash->{template} = 'login/top.tt';
}

sub confirm :Local :Args {
  my ($self,$c) = @_;
  my $member_id = $c->session->{member_id};

  $c->stash->{member_id} = $member_id;
  $c->stash->{template} = 'login/confirm.tt';
}

sub execute :Local :Args {
  my ($self,$c) =@_;
  #my $member_id = $c->session->{member_id};
  my $mail_address = $c->req->param('mail_address');
  my $pass_word    = $c->req->param('pass_word');

  my $members = $self->select_member_by_mail_and_pass($c,$mail_address,$pass_word);
  if (scalar(@$members)==0){
    #redirect
    $c->res->redirect($c->uri_for('/login/top'));
    return;
  }
  my $member = shift(@$members);
  $c->session->{member_id} = $member->id;
  $c->session->{member}    = $member;
  $c->res->redirect($c->uri_for('/self/index'));
}

sub select_member_by_mail_and_pass :Private {
  my ($self,$c,$mail_address,$pass_word) = @_;

  my $records = $c->model('DB2::Member')->search(
    {
      mail_address => $mail_address,
      pass_word    => $pass_word,
    }
  );
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
