package EdoWorld::Common::Session;
use Data::Dumper;

sub get_member_id{
  my($c)=@_;
  return 1;
  #my $member_id = undef;
  my $member_id = $c->session->{member_id};
  if (defined $member_id){
    $c->res->redirect($c->uri_for('/login/top'));
    return 2;
  }
  return $member_id;
}

1;
