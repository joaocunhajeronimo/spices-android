class VideoView < BaseComponent
  def playing?
    self['query', 'isPlaying']
  end

  def duration
    duration = Spices.world.query(query_string, 'getDuration')[0]
    # self query does not seem to work for 'getDuration': self['query', 'getDuration']
    duration / 1000
  end

  private

  def type
    :videoView
  end
end
