module Scrollable
  def scroll_up
    scroll :up
  end

  def scroll_down
    scroll :down
  end

  def scroll_to_bottom
    scroll_to_end :down
  end

  def scroll_to_top
    scroll_to_end :up
  end

  private

  def scroll(direction)
    self['scroll', direction]
  end

  def scroll_to_end(direction)
    step = 250

    while content_offset_y < (content_size_y - height)
      scroll direction
      sleep 0.8
    end
  end

  def content_size_x
    content_size.first.to_i
  end

  def content_size_y
    content_size.last.to_i
  end

  def content_size
    self[:query, :contentSize][/{(.*?)}/m, 1].split(", ")
  end

  def content_offset_x
    content_offset['X']
  end

  def content_offset_y
    content_offset['Y']
  end

  def content_offset
    self[:contentOffset]
  end
end
