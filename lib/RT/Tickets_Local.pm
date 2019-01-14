package RT::Tickets;

use strict;
no warnings qw(redefine);

{
    # Provide a wrapper to the sub procedure
    # This is perl awesomeness!

    my $ticketFromSQL = \&FromSQL;

    *FromSQL = sub {
        my $self = shift;
        my $query = shift // '';

        my $minId = $self->SearchFilterMinTicketId();

        if ($query && $minId > 0) {
            if ($query !~ m/id\s+?[<>=!]/) {
                RT->Logger->debug('DefaultSearchFilter: No id found. Append id to query');

                $query = sprintf('id >= %d and (%s)', $minId, $query);

                RT->Logger->debug('DefaultSearchFilter: New query [' . $query . ']');
            }
        }

        return $ticketFromSQL->($self, $query);
    };
}

sub SearchFilterMinTicketId {
    my $self = shift;

    return RT->Config->Get('DefaultSearchFilter_MinTicketId') // '';
}

1;