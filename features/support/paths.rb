module NavigationHelpers
  def path_to_with_announcements(page_name)
    case page_name

    when /the edit page of Announcement/
      '/announcements/1/edit'
    else
      path_to_without_announcements(page_name)
    end
  end

  alias_method_chain :path_to, :announcements
end

World(NavigationHelpers)