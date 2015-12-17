class BaseComponent
  attr_reader :accessibility_label
  attr_reader :text
  attr_reader :parent
  attr_reader :descendants

  # initializers

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

  def self.with_descendants(descendants)
    object = new
    object.descendants = descendants
    object
  end

  def with_text(text)
    @text = text
    self
  end

  def with_parent(parent)
    @parent = parent
    self
  end

  def with_accessibility_label(accessibility_label)
    @accessibility_label = accessibility_label
    self
  end

  def with_descendants(descendants)
    @descendants = descendants
    self
  end

  # setters

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

  def descendants=(descendants)
    @descendants = descendants
    self
  end

  # subscript

  def [](key)
    query_properties key
  end

  # abstract

  def type
    fail NotImplementedError, "This method should be implemented in a subclass of #{self.class}"
  end

  # diggers

  def label
    Label.with_parent self
  end

  def button
    Button.with_parent self
  end

  def Switch
    Switch.with_parent self
  end

  def tabbar_button
    TabbarButton.with_parent self
  end

  def table_view_cell
    TableViewCell.with_parent self
  end

  def table_view
    TableView.with_parent self
  end

  def view
    View.with_parent self
  end

  def textfield
    Textfield.with_parent self
  end

  def web_view
    WebView.with_parent self
  end

  def web_view_element
    WebViewElement.with_parent self
  end

  # computed properties

  def query_string
    string = "#{type}"
    string += " {accessibilityLabel = '#{accessibility_label}'}" unless accessibility_label.nil?
    string += " {text = '#{text}'}" unless text.nil?

    current_query_string = string

    @descendants ||= []
    @descendants.each do |descendant|
      string += ' descendant ' + descendant.query_string + ' parent ' + current_query_string
    end

    string = parent.query_string + " #{string}" unless parent.nil?

    string
  end

  # query

  def query_properties(*args)
    safe_query(query_string, *args)
  end

  def query
    safe_query(query_string)
  end

  # touch

  def touch
    safe_touch query_string
  end

  # visible

  def wait_for_visible
    Wait.for { visible? }
  end

  def wait_for_not_visible
    Wait.for { not_visible? }
  end

  def visible?
    zucchini.element_exists query_string
  end

  def not_visible?
    zucchini.element_does_not_exist query_string
  end

  private

  def zucchini
    Zucchini.instance
  end

  def safe_query(query, *args)
    Logger.debug "QUERY: #{query}".light_green.bold

    wait_for_visible

    query_map = zucchini.query(query, *args).first

    Logger.debug "MAP: #{query_map}".light_blue.bold

    query_map
  end

  def safe_touch(touch_query)
    wait_for_visible

    zucchini.touch touch_query
    Wait.for_ui_animation_to_end
  end
end
