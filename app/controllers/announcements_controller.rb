class AnnouncementsController < ApplicationController
  unloadable

  def edit
    @announcement = Announcement.only_one
  end

  def update
    @announcement = Announcement.only_one

    @announcement.update_attributes(params[:announcement])

    render :action => 'edit'
  end

end