class CreateAnnouncement < ActiveRecord::Migration
  def self.up
    create_table :announcements, :force => true do |t|
      t.text :text
      t.date :show_until
      t.boolean :active, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :announcements

  end
end
