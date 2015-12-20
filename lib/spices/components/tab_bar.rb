class TabBar < BaseComponent
  def selected_title
    self['query', 'selectedItem', 'title']
  end

  private

  def type
    :tabBar
  end
end
