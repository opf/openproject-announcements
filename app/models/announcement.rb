class Announcement < ActiveRecord::Base
  named_scope :active, :conditions => {:active => true}
  named_scope :current, :conditions => ['show_until >= ?', Date.today]

  attr_accessible :text,
                  :show_until
                  :active

  def self.active_and_current
    active.current.first
  end

  def self.only_one
    a = first
    a = create_default_announcement if a.nil?
    a
  end

  def active_and_current?
    active? && show_until >= Date.today
  end

  private
  def self.create_default_announcement
    Announcement.create :text => "Announcement",
                        :show_until => Date.today + 14.days,
                        :active => false
  end
end
