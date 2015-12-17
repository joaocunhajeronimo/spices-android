class Switch < BaseComponent
  def on
    touch if off?
  end

  def off
    touch if on?
  end

  private

  def on?
    property_is_on == 1
  end

  def off?
    property_is_on == 0
  end

  def type
    :switch
  end

  def property_is_on
    query_properties(:isOn)
  end
end
