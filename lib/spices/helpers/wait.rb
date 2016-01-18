class Wait
  def self.for(timeout = 15, &_block)
    Spices.world.wait_for(timeout: timeout, retry_frequency: 0.5, screenshot_on_error: true) do
      yield
    end
  end
end
