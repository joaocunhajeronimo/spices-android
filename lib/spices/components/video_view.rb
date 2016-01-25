class VideoView < View
  def type
    :videoView
  end

  def playing?
    self['query', 'isPlaying']
  end

  def duration
    duration = Spices.world.query('videoView', 'getDuration')[0]
    # self query does not seem to work for 'getDuration': self['query', 'getDuration']
    duration / 1000
  end
end
