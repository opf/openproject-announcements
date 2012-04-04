require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare do
  require_dependency 'announcements/hooks'
end


Redmine::Plugin.register :redmine_announcements do
  name 'Redmine Announcements plugin'
  author 'Jens Ulferts @ Finnlabs'
  description 'Adds announcements to the login page which are configurable for admins'
  version '0.2.5'

  menu :admin_menu, :announcements,
      {:controller => 'announcements', :action => 'edit'},
       :caption => 'Announcement'
end
