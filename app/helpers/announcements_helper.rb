module AnnouncementsHelper
  def announcement_date_field_with_calendar(interval, field_name)
    ret = label_tag 'announcement_#{field_name}', l("announcements.#{field_name}")
    ret += text_field_tag "announcement[#{field_name}]", interval.strftime("%Y-%m-%d"), :size => 10, :name => "announcement[#{field_name}]"

    ret += calendar_for("announcement_#{field_name}")

    ret
  end

  def notice_annoucement_active
    if @announcement.active_and_current?
			l(:'announcements.is_active')
		else
			l(:'announcements.is_inactive')
		end
  end
end
