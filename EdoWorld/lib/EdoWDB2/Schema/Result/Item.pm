use utf8;
package EdoWDB2::Schema::Result::Item;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EdoWDB2::Schema::Result::Item

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

=head1 TABLE: C<items>

=cut

__PACKAGE__->table("items");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

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

  data_type: 'integer'
  is_nullable: 1

=head2 comment

  data_type: 'longtext'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "code",
  { data_type => "varchar", is_nullable => 1, size => 250 },
  "genre_code",
  { data_type => "varchar", is_nullable => 1, size => 250 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 250 },
  "price",
  { data_type => "integer", is_nullable => 1 },
  "comment",
  { data_type => "longtext", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-18 19:24:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PelIaywj2ENhipF+iGfmOg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
