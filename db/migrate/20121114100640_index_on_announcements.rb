class IndexOnAnnouncements < ActiveRecord::Migration
  def self.up
    add_index :announcements, [:show_until, :active]
  end

  def self.down
    remove_index :announcements, [:show_until, :active]
  end
end
