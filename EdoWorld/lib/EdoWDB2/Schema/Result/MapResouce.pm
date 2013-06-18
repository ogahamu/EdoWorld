use utf8;
package EdoWDB2::Schema::Result::MapResouce;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EdoWDB2::Schema::Result::MapResouce

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

=head1 TABLE: C<map_resouces>

=cut

__PACKAGE__->table("map_resouces");

=head1 ACCESSORS

=head2 member_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 map_id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 population

  data_type: 'integer'
  is_nullable: 1

äººå£

=head2 economic_point

  data_type: 'integer'
  is_nullable: 1

éè(è²¡æº)

=head2 agriculture_point

  data_type: 'integer'
  is_nullable: 1

è¾²æ¥­(è²¡æº)

=head2 industry_point

  data_type: 'integer'
  is_nullable: 1

å·¥æ¥­(è²¡æº)

=head2 sightseeing_point

  data_type: 'integer'
  is_nullable: 1

è¦³å(è²¡æº)

=head2 military_point

  data_type: 'integer'
  is_nullable: 1

åµå(è²¡æº)

=head2 house_point

  data_type: 'integer'
  is_nullable: 1

ä½å±(äººå£)

=head2 food_point

  data_type: 'integer'
  is_nullable: 1

é£æ(é¤æ­»)

=head2 amusement_point

  data_type: 'integer'
  is_nullable: 1

å¨¯æ¥½(ä¸æº)

=head2 safe_point

  data_type: 'integer'
  is_nullable: 1

æ²»å®(ä¸æº)

=head2 environment_point

  data_type: 'integer'
  is_nullable: 1

ç°å¢(ä¸æº)

=head2 religion_point

  data_type: 'integer'
  is_nullable: 1

å®æ(ä¸æº)

=head2 employment_point

  data_type: 'integer'
  is_nullable: 1

éç¨(ä¸æº)

=cut

__PACKAGE__->add_columns(
  "member_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "map_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "population",
  { data_type => "integer", is_nullable => 1 },
  "economic_point",
  { data_type => "integer", is_nullable => 1 },
  "agriculture_point",
  { data_type => "integer", is_nullable => 1 },
  "industry_point",
  { data_type => "integer", is_nullable => 1 },
  "sightseeing_point",
  { data_type => "integer", is_nullable => 1 },
  "military_point",
  { data_type => "integer", is_nullable => 1 },
  "house_point",
  { data_type => "integer", is_nullable => 1 },
  "food_point",
  { data_type => "integer", is_nullable => 1 },
  "amusement_point",
  { data_type => "integer", is_nullable => 1 },
  "safe_point",
  { data_type => "integer", is_nullable => 1 },
  "environment_point",
  { data_type => "integer", is_nullable => 1 },
  "religion_point",
  { data_type => "integer", is_nullable => 1 },
  "employment_point",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</map_id>

=back

=cut

__PACKAGE__->set_primary_key("map_id");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-18 19:24:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gk8QAN/jAMA7Ezxkea+EBQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
