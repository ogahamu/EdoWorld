use utf8;
package DB2::Schema::Result::Position;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB2::Schema::Result::Position

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<positions>

=cut

__PACKAGE__->table("positions");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 code

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "code",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-18 19:20:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CZ96HSUIO1fNRgoZ5H3XBQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
