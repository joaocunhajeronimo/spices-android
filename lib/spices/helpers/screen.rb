class Screen
  def self.default_device
    Spices.world.default_device
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

  def self.home_direction
    Spices.world.home_direction
  end

  def self.portrait?
    home_direction == :down || home_direction == :up
  end

  def self.landscape?
    home_direction == :left || home_direction == :right
  end

  def self.rotate(dir)
    Spices.world.rotate dir
  end

  def self.rotate_to_landscape
    Spices.world.rotate_home_button_to :left
  end

  def self.rotate_to_portrait
    Spices.world.rotate_home_button_to :down
  end
end
