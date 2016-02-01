class VideoView < BaseComponent
  def playing?
    self['isPlaying']
  end

  def duration
    self['getDuration'] / 1000
  end

  private

  def type
    :videoView
  end
end
