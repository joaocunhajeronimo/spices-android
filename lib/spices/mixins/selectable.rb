module Selectable
  def select
    self['setSelected:', true]
  end

  def deselect
    self['setSelected:', false]
  end

  def selected?
    self['isSelected']
  end
end
