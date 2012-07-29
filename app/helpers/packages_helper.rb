module PackagesHelper
  def switch_span(category, content)
    if current_page?(packages_path)
      if category == "title"
        @span = "span5"
      end
    else
      @span = "span6"
    end
    
    content_tag(:div, content, class: @span)
  end
end
