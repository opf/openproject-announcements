OpenProject Announcements Plugin
===========================


OpenProject Plugin for showing announcements on the login page.

A more detailed description can be found on [OpenProject.org](https://community.openproject.org/projects/announcement).


Requirements
------------

The OpenProject Announcements plugin requires the [OpenProject Core](https://github.com/opf/openproject/) in the same version.


Installation
------------

For OpenProject Announcements you need to add the following line to the `Gemfile.plugins` of OpenProject (if you use a different OpenProject version than OpenProject 5, adapt `:branch => "stable/5"` to your OpenProject version):

`gem "openproject-announcements", git: "https://github.com/finnlabs/openproject-announcements.git", :branch => "stable/5"`

Afterwards, run:

`bundle install`

This plugin contains migrations. To migrate the database, run:

`rake db:migrate`


Deinstallation
--------------

Remove the line

`gem "openproject-announcements", git: "https://github.com/finnlabs/openproject-announcements.git", :branch => "stable/5"`

from the file `Gemfile.plugins` and run:

`bundle install`

Please not that this leaves plugin data in the database. Currently, we do not support full uninstall of the plugin.


Bug Reporting
-------------

If you find any bugs, you can create a bug ticket at

https://community.openproject.org/projects/announcement


Development
-----------

To contribute, you can create pull request on the official repository at
`https://github.com/finnlabs/openproject-announcements`

Licence
-------

Copyright (C) 2011 - 2015 the OpenProject Foundation (OPF)

This plugin is licensed under the GNU GPL v3. See doc/COPYRIGHT.md and doc/GPL.txt for details.
