use strict;
use warnings;

package RT::Extension::DefaultSearchFilter;

our $VERSION = '0.01';

=head1 NAME

RT-Extension-DefaultSearchFilter - Add minimum id to every search operation

=head1 DESCRIPTION

Offload unwanted tickets from users

=head1 RT VERSION

Works with RT 4.4.3

=head1 INSTALLATION

=over

=item C<perl Makefile.PL>

=item C<make>

=item C<make install>

May need root permissions

=item Edit your F</opt/rt4/etc/RT_SiteConfig.pm>

Add this line:

    Plugin('RT::Extension::DefaultSearchFilter');

=item Clear your mason cache

    rm -rf /opt/rt4/var/mason_data/obj

=item Restart your webserver

=back

=head1 AUTHOR

NETWAYS GmbH <support@netways.de>

=head1 BUGS

All bugs should be reported on L<GitHub|https://github.com/NETWAYS/rt-extension-defaultsearchfilter>.

=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2018 by NETWAYS GmbH
This is free software, licensed under:
  The GNU General Public License, Version 2, June 1991

1;
