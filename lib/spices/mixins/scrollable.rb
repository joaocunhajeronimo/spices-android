module Scrollable
  def scroll_up
    scroll :up
  end

  def scroll_down
    scroll :down
  end

  def scroll_to_bottom
    scroll_by_offset height
  end

  def scroll_to_top
    scroll_by_offset(-height)
  end

  private

  def scroll_by_offset(offset)
    Spices.world.query(query_string, scrollBy: [0, offset])
  end

  def height
    self['height']
  end

  def scroll(direction)
    Spices.world.scroll(query_string, direction)
  end
end
