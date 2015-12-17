class Wait
  def self.for(&_block)
    Zucchini.instance.wait_for(timeout: 15, retry_frequency: 0.5, screenshot_on_error: true) do
      yield
    end
  end

  def self.for_ui_animation_to_end
    Zucchini.instance.wait_for_none_animating(timeout: 10, screenshot_on_error: false)
  rescue
    Logger.debug '** Animation ended **'
  end
end
