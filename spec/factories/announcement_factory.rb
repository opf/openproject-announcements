Factory.define :announcement do |a|
  a.text "Announcement text"
  a.show_until Date.today + 14.days
  a.active true
end

Factory.define :active_announcement, :parent => :announcement do |a|
  a.active true
end

Factory.define :inactive_announcement, :parent => :announcement do |a|
  a.active false
end