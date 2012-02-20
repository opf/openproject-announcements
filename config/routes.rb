ActionController::Routing::Routes.draw do |map|
  map.connect 'admin/announcement/edit', :controller => 'announcements', :action => 'edit'
  map.connect 'admin/announcement/update', :controller => 'announcements', :action => 'update'
end
