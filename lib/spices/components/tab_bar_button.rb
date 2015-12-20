class TabBarButton < BaseComponent
  def title
    label['text']
  end

  private

  def type
    :tabBarButton
  end
end
