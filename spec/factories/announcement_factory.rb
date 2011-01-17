Factory.define :announcement do |a|
  a.text "Announcement text"
  a.show_until (Date.today + 14.days)
  a.active true
end