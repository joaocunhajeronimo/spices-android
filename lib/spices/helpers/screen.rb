class Screen
  def self.default_device
    Spices.instance.default_device
  end

  def self.height
    default_device.screen_dimensions[:height]
  end

  def self.width
    default_device.screen_dimensions[:width]
  end

  def self.scale
    default_device.screen_dimensions[:scale]
  end

  def self.height_scaled
    height / scale
  end

  def self.width_scaled
    width / scale
  end
end
