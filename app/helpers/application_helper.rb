module ApplicationHelper
  def page_title
    title = "Memories"
    title = @page_title + "-" + title if @page_title
    title
  end

  def menu_link_to(text, path, options = {})
    content_tag (:li) do
      # :methodに渡されたURLと開いてるページが同じか判別
      condition = options[:method] || !current_page?(path)
      
      link_to_unless_current(text, path, options) do
        content_tag(:span, text)
      end
    end
  end
end
