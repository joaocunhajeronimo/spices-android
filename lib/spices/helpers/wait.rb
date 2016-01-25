class Wait
  def self.for(timeout=15, &_block)
    Spices.world.wait_for(timeout: timeout, retry_frequency: 0.5, screenshot_on_error: true) do
      yield
    end
  end

  def self.for_not_to_happen(timeout_value, &_block)
    retry_frequency = 0.1

    begin
      Timeout.timeout(timeout_value, TimeoutError) do
        sleep retry_frequency until yield
        fail 'Something that was not supposed to happen happened' if yield
      end
    rescue TimeoutError
      'Something that was not supposed to happen did not happen. All good'
    rescue => e
      Spices.world.screenshot_and_raise e
    end
  end

  def self.for_and_do(test, &_block)
    Spices.world.wait_poll(timeout: 15, timeout_message: '', until: test) do
      yield
    end
  end
end
