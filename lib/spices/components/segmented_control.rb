class SegmentedControl < BaseComponent
  def selected_index
    self['selectedSegmentIndex']
  end

  def selected_title
    self['titleForSegmentAtIndex:', selected_index]
  end

  private

  def type
    :segmentedControl
  end
end
