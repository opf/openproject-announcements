class Announcement < ActiveRecord::Base
  named_scope :active, :conditions => {:active => true}
  named_scope :current, :conditions => ['show_until >= ?', Date.today]

  def self.active_and_current
    active.current.first
  end

  def self.only_one
    a = first
    a = create_default_announcement if a.nil?
    a
  end

  private
  def self.create_default_announcement
    Announcement.create :text => "Announcement",
                            :show_until => Date.today + 14.days,
                            :active => false
  end
end