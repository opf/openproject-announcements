ActionController::Routing::Routes.draw do |map|
  map.connect 'announcements/:id/edit', :controller => 'announcements', :action => 'edit', :id => /.+/
  #map.connect 'announcement', :controller => 'cost_reports', :project_id => /.+/
end