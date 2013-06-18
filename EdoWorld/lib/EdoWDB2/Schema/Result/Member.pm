use utf8;
package EdoWDB2::Schema::Result::Member;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EdoWDB2::Schema::Result::Member

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

=head1 TABLE: C<members>

=cut

__PACKAGE__->table("members");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 ssid

  data_type: 'integer'
  is_nullable: 1

=head2 nick_name

  data_type: 'varchar'
  is_nullable: 1
  size: 250

=head2 pass_word

  data_type: 'varchar'
  is_nullable: 1
  size: 250

=head2 mail_address

  data_type: 'varchar'
  is_nullable: 1
  size: 250

=head2 amount

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 max_amount

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 bank_amount

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 bank_max_amount

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 coin_amount

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 power

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 max_power

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 speed

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 max_speed

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 created_at

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 update_at

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "ssid",
  { data_type => "integer", is_nullable => 1 },
  "nick_name",
  { data_type => "varchar", is_nullable => 1, size => 250 },
  "pass_word",
  { data_type => "varchar", is_nullable => 1, size => 250 },
  "mail_address",
  { data_type => "varchar", is_nullable => 1, size => 250 },
  "amount",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "max_amount",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "bank_amount",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "bank_max_amount",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "coin_amount",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "power",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "max_power",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "speed",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "max_speed",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "created_at",
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
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-18 19:24:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jd0uEFn+K4G4Ow0/k7EYQA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
