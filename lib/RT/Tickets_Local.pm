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

        my $appendQuery = $self->SearchFilterAppendQuery();

        if ($query && $appendQuery) {
            if ($self->SearchFilterDisableOperator) {
                $query = $appendQuery . ' ' . $query;
            } else {
                $query = sprintf('(%s) and (%s)', $appendQuery, $query);
            }

            RT->Logger->debug('DefaultSearchFilter: Rewrite to ' . $query);
        }

        return $ticketFromSQL->($self, $query);
    };
}

sub SearchFilterAppendQuery {
    my $self = shift;

    return RT->Config->Get('DefaultSearchFilter_AppendQuery') // '';
}

sub SearchFilterDisableOperator {
    return RT->Config->Get('DefaultSearchFilter_DisableOperator') // '';
}

1;