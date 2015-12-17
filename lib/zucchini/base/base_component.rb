class BaseComponent
  attr_reader :accessibility_label
  attr_reader :text
  attr_reader :parent

  # initialize

  def self.with_text(text)
    object = new
    object.text = text
    object
  end

  def self.with_accessibility_label(accessibility_label)
    object = new
    object.accessibility_label = accessibility_label
    object
  end

  def self.with_parent(parent)
    object = new
    object.parent = parent
    object
  end

  def text=(text)
    @text = text
    self
  end

  def accessibility_label=(accessibility_label)
    @accessibility_label = accessibility_label
    self
  end

  def parent=(parent)
    @parent = parent
    self
  end

  def type
    fail NotImplementedError, "This method should be implemented in a subclass of #{self.class}"
  end

  def label
    Label.with_parent self
  end

  # computed properties

  def query_string
    string = "#{type}"
    string += " {accessibilityLabel = '#{accessibility_label}'}" unless accessibility_label.nil?
    string += " {text = '#{text}'}" unless text.nil?

    string = parent.query_string + " #{string}" unless parent.nil?

    string
  end

  def query_properties(*args)
    safe_query(query_string, *args)
  end

  def query
    safe_query(query_string)
  end

  def touch
    safe_touch query_string
  end

  def wait_for_displayed
    Wait.for { displayed? }
  end

  def wait_for_not_displayed
    Wait.for { not_displayed? }
  end

  def displayed?
    zucchini.element_exists query_string
  end

  def not_displayed?
    zucchini.element_does_not_exist query_string
  end

  # query properties

  def text_content
    query_properties(:text)
  end

  def text_content?(text)
    text_content == text
  end

  def frame
    query_properties(:frame)
  end

  def x
    frame['X']
  end

  def y
    frame['Y']
  end

  private

  def zucchini
    Zucchini.instance
  end

  def safe_query(query, *args)
    Logger.debug "QUERY: #{query}".light_green.bold

    wait_for_displayed

    query_map = zucchini.query(query, *args).first

    Logger.debug "MAP: #{query_map}".light_blue.bold

    query_map
  end

  def safe_touch(touch_query)
    wait_for_displayed

    zucchini.touch touch_query
    Wait.for_ui_animation_to_end
  end
end
