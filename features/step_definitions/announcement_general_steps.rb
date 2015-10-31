Given /^there is an (active|inactive) announcement saying (.+)$/ do |status, text|
  active = status == 'active' ? true : false
  text = text.delete("\"")
  FactoryGirl.create(:announcement, text: text, active: active)
end
