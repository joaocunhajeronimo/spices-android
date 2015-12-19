class ProgressView < BaseComponent
  def progress
    self['progress']
  end

  private

  def type
    :progressView
  end
end
