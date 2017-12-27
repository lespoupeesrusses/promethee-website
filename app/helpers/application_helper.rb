module ApplicationHelper
  def active_on(path)
    raw ' class="active"' if current_page? path
  end
end
