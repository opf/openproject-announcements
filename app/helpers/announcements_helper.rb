module AnnouncementsHelper
  def announcement_date_field_with_calendar(interval, field_name)
		label_name = "label_" + field_name
		ret = "<label>#{l(label_name.to_sym)}</label>"

		ret += text_field_tag "announcement[#{field_name}]", interval.strftime("%Y-%m-%d"), :size => 10, :name => "announcement[#{field_name}]"

		ret += calendar_for("announcement_#{field_name}")

		ret
	end
end