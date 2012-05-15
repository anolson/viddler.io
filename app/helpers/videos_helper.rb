module VideosHelper
  def prev_page(page)
    if(page.to_i <= 1)
      page("Prev", '#', true)
    else
      page("Prev", videos_path(:page => page - 1))
    end
  end
  
  def next_page(page)
    if @videos.empty? 
      page("Next", '#', true)
    else
      page("Next", videos_path(:page => page + 1))
    end
  end
  
  def page(name, path, disabled = false)   
    content_tag :li, (disabled && { :class => :disabled } )  do
      link_to name, path
    end  
  end  
end