module Scrollable
  def scroll_up
    Zucchini.instance.scroll(query_string, :up)
  end

  def scroll_down
    Zucchini.instance.scroll(query_string, :down)
  end

  def scroll_bottom
    10.times { scroll_down }
  end
end
