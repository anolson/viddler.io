module VideosHelper
  def prev_page(page)
    if(page.to_i <= 1)
      content_tag :li, :class => :disabled do
        link_to "Prev", '#'
      end
    else
      content_tag :li do
        link_to "Prev", videos_path(:page => page - 1)
      end
    end
  end
  
  def next_page(page)
    if @videos.empty? 
      content_tag :li, :class => :disabled do
        link_to "Next", '#'
      end
    else
      content_tag :li do
        link_to "Next", videos_path(:page => page + 1)
      end
    end
  end   
end