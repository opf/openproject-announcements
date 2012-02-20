class AnnouncementsController < ApplicationController
  unloadable
  layout 'admin'

  def edit
    @announcement = Announcement.only_one
  end

  def update
    @announcement = Announcement.only_one

    if @announcement.update_attributes(params[:announcement])
      flash[:notice] = l(:notice_successful_update)
    end

    render :action => 'edit'
  end

  private

  def default_breadcrumb
    l('announcements.announcement')
  end
end
