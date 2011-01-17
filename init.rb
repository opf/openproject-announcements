require 'redmine'

Redmine::Plugin.register :redmine_announcements do
  name 'Redmine Announcements plugin'
  author 'Jens Ulferts @ Finnlabs'
  description 'This is a plugin for Redmine'
  version '0.0.1'

  menu :admin_menu, :announcements,
      {:controller => 'announcements', :action => 'edit'},
       :caption => 'Announcement'
end
