class AnnouncementsController < ApplicationController
  unloadable
  layout 'admin'

  before_filter :require_admin

  def edit
    @announcement = Announcement.only_one
  end

  def update
    @announcement = Announcement.only_one
    @announcement.attributes = params[:announcement]

    if @announcement.save
      flash[:notice] = l(:notice_successful_update)
    end

    render :action => 'edit'
  end

  private

  def default_breadcrumb
    l('announcements.announcement')
  end
end
