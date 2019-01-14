# DefaultSearchFilter Extension for Request Tracker

#### Table of Contents

1. [About](#about)
2. [License](#license)
3. [Support](#support)
4. [Requirements](#requirements)
5. [Installation](#installation)
6. [Configuration](#configuration)

## About

This extensions adds an id filter to every query fired in RT. Mainly used to hide historical tickets or
hide specific status combination.

You can still jump to tickets with a specific id. Only RTQL is restricted, not the perl oo interface.

***If an id is configured in search, the filter will be omitted.***

## License

This project is licensed under the terms of the GNU General Public License Version 2.

This software is Copyright (c) 2018 by NETWAYS GmbH <[support@netways.de](mailto:support@netways.de)>.

## Support

For bugs and feature requests please head over to our [issue tracker](https://github.com/NETWAYS/rt-extension-defaultsearchfilter/issues).
You may also send us an email to [support@netways.de](mailto:support@netways.de) for general questions or to get technical support.

## Requirements

- RT >= 4.4.2

## Installation

Extract this extension to a temporary location

Git clone:

```
cd /usr/local/src
git clone https://github.com/NETWAYS/rt-extension-defaultsearchfilter
```

Navigate into the source directory and install the extension.

```
perl Makefile.PL
make
make install
```

Clear your mason cache.

```
rm -rf /opt/rt4/var/mason_data/obj
```

Restart your web server.

```
systemctl restart httpd

systemctl restart apache2
```

## Configuration

Edit your `/opt/rt4/etc/RT_SiteConfig.pm` configuration and include the extension.

```
Plugin('RT::Extension::DefaultSearchFilter');
Set($DefaultSearchFilter_MinTicketId, 3000000);
```

The above example generates the following result:

### Original Query

```
(Status = '__Active__') AND (Queue = 1 OR Queue = 3 OR Queue = 4)
```

### Rewritten

```
id >= 3000000 and ((Status = '__Active__') AND (Queue = 1 OR Queue = 3 OR Queue = 4)
```
