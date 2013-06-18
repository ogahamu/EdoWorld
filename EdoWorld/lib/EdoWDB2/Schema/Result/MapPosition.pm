use utf8;
package EdoWDB2::Schema::Result::MapPosition;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EdoWDB2::Schema::Result::MapPosition

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

=head1 TABLE: C<map_positions>

=cut

__PACKAGE__->table("map_positions");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 member_id

  data_type: 'integer'
  is_nullable: 1

=head2 map_id

  data_type: 'integer'
  is_nullable: 1

=head2 position_id

  data_type: 'integer'
  is_nullable: 1

=head2 position_code

  data_type: 'integer'
  is_nullable: 1

=head2 position_flag

  data_type: 'integer'
  is_nullable: 1

=head2 position_at

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 fix_plan_time

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 fixed_at

  data_type: 'integer'
  is_nullable: 1

=head2 fixed_flag

  data_type: 'integer'
  is_nullable: 1

=head2 create_at

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 update_at

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 item_id

  data_type: 'integer'
  is_nullable: 1

=head2 item_name

  data_type: 'varchar'
  is_nullable: 1
  size: 250

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "member_id",
  { data_type => "integer", is_nullable => 1 },
  "map_id",
  { data_type => "integer", is_nullable => 1 },
  "position_id",
  { data_type => "integer", is_nullable => 1 },
  "position_code",
  { data_type => "integer", is_nullable => 1 },
  "position_flag",
  { data_type => "integer", is_nullable => 1 },
  "position_at",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "fix_plan_time",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "fixed_at",
  { data_type => "integer", is_nullable => 1 },
  "fixed_flag",
  { data_type => "integer", is_nullable => 1 },
  "create_at",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "update_at",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "item_id",
  { data_type => "integer", is_nullable => 1 },
  "item_name",
  { data_type => "varchar", is_nullable => 1, size => 250 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-18 19:24:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9Ly5N/R9/l3P8++J8Rh7Tg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
