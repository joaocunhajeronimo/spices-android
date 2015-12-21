class Checkbox < BaseComponent
  def check
    touch if unchecked?
  end

  def uncheck
    touch if checked?
  end

  def checked?
    property_is_checked
  end

  def unchecked?
    !property_is_checked
  end

  private

  def type
    :Checkbox
  end

  def property_is_checked
    self['checked']
  end
end
