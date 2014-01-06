module AnnouncementsHelper
  def announcement_date_field_with_calendar(form, interval, field_name)
    date = (interval.present? ? interval.strftime("%Y-%m-%d") : '')

    ret = form.label field_name.to_sym, l("announcements.#{field_name}")
    ret += form.text_field field_name.to_sym, value: date, size: 10
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
