use utf8;
package MyApp::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::User

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

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 login

  data_type: 'varchar'
  is_nullable: 0
  size: 16

=head2 email

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 password

  data_type: 'varchar'
  is_nullable: 0
  size: 16

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "login",
  { data_type => "varchar", is_nullable => 0, size => 16 },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "password" => {
      passphrase => 'rfc2307',
      passphrase_class => 'SaltedDigest',
      passphrase_args => {
        algorithm => 'SHA-1',
        salt_random => 20,
      },
      passphrase_check_method => 'check_password',
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<email>

=over 4

=item * L</email>

=back

=cut

__PACKAGE__->add_unique_constraint("email", ["email"]);

=head2 C<login>

=over 4

=item * L</login>

=back

=cut

__PACKAGE__->add_unique_constraint("login", ["login"]);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2022-08-07 22:47:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kUoVemWyJkBSGxiHJEs+jA

sub get_login {
  my ($self) = @_;

  return $self->login;
}


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
