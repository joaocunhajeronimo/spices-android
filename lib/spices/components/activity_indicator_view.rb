class ActivityIndicatorView < BaseComponent
  def animating?
    self['isAnimating']
  end

  private

  def type
    :activityIndicatorView
  end
end
