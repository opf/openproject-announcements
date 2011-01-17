class AnnouncementsController < ApplicationController
  unloadable

  def edit
    begin
      @announcement = Announcement.find(params[:id])
    rescue
      @announcement = Announcement.create(:show_until => Time.now + 14.days)
    end


  end
end