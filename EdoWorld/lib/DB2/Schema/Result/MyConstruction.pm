use utf8;
package DB2::Schema::Result::MyConstruction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB2::Schema::Result::MyConstruction

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

=head1 TABLE: C<my_constructions>

=cut

__PACKAGE__->table("my_constructions");

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

=head2 code

  data_type: 'varchar'
  is_nullable: 1
  size: 250

=head2 genre_code

  data_type: 'varchar'
  is_nullable: 1
  size: 250

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 250

=head2 price

  data_type: 'varchar'
  is_nullable: 1
  size: 250

=head2 comment

  data_type: 'longtext'
  is_nullable: 1

=head2 available_flag

  data_type: 'integer'
  default_value: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "member_id",
  { data_type => "integer", is_nullable => 1 },
  "map_id",
  { data_type => "integer", is_nullable => 1 },
  "code",
  { data_type => "varchar", is_nullable => 1, size => 250 },
  "genre_code",
  { data_type => "varchar", is_nullable => 1, size => 250 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 250 },
  "price",
  { data_type => "varchar", is_nullable => 1, size => 250 },
  "comment",
  { data_type => "longtext", is_nullable => 1 },
  "available_flag",
  { data_type => "integer", default_value => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-18 19:20:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mv6rgETx7Op2OsDUBxANhQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
