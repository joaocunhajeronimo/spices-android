class Keyboard
  def self.done
    Spices.world.tap_keyboard_action_key
  end

  def self.hide
    Spices.world.hide_soft_keyboard
  end
end
