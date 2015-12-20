class TabBar < BaseComponent
  def titles
    tab_bar_button.label.all['title']
  end

  def selected_title
    self['query', 'selectedItem', 'title']
  end

  private

  def type
    :tabBar
  end
end
