package EdoWorld::Controller::my_construction;
use Moose;
use namespace::autoclean;
#use lib ('/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/');
#use Image::Magick;

BEGIN {extends 'Catalyst::Controller'; }

sub index :Local :Args {
    my ( $self, $c ) = @_;

    my $member_id = 1;
    $self->select_my_construction($c,$member_id);
    $c->response->body('Matched EdoWorld::Controller::my_construction in my_construction.');
}

sub list :Local :Args {
    my ( $self, $c ) = @_;

    my $member_id = 1;
	my $map_positions = $self->select_map_positions($c,$member_id);

    #template
    $c->stash->{map_positions} = $map_positions;
    $c->stash->{template} = 'my_construction/list.tt';
}

sub build :Local :Args {
  my ($self,$c) = @_;
  my $member_id = 1;

  #req
  my $param_x = $c->req->param('param_x');
  my $param_y = $c->req->param('param_y');
  my $position_code = $param_x.$param_y;
  my $map_position_id = $c->req->param('map_position_id');

  #data
  my $map_positions = $c->model('DB2::MapPosition')->find($map_position_id);
  $map_positions->position_code($position_code);
  $map_positions->position_flag(1);
  $map_positions->update();

  #template
  $c->stash->{template} = 'my_construction/build.tt';
}

sub insert_map_positions :Local{
  my($self,$c,$items) = @_;
  my $row = $c->model('DB2::MapPosition')->create({
    member_id     => 1,
    map_id        => '',
    position_id   => '',
    position_code => '',
    position_flag => 'AAA',
    fixed_at      => 1000,
    fixed_flag    => '',
    create_at     => '',
    update_at     => '',
    item_id       => 1,
    item_name     => 1,
  });
}

sub gazou :Local{
  my ($self,$c) = @_;
  my $member_id = 1;

  $c->stash->{template} = 'my_construction/list.tt';
}

sub select_map_positions :Private {
  my ($self,$c,$member_id) = @_;
  my $records = $c->model('DB2::MapPosition')->search(
    {
      member_id     => $member_id,
      position_flag => 0,
    }
  );
  my @dataarray=();
  while(my $rec = $records->next){
    push(@dataarray,$rec);
  }
  return \@dataarray;
}

sub select_positions :Private {
  my ($self,$c,$position_code) = @_;
  my $records = $c->model('DB2::Position')->search(
    {
      position_code => $position_code
    }
  );
  my @dataarray=();
  while(my $rec = $records->next){
    push(@dataarray,$rec);
  }
  return \@dataarray;
}

1;
