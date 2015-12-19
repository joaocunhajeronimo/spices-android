class BaseComponent
  attr_reader :parent
  attr_reader :descendants
  attr_reader :attributes

  # initializers

  def self.with_text(text)
    object = new
    object.attributes.push "text = '#{text}'"
    object
  end

  def self.with_accessibility_label(accessibility_label)
    object = new
    object.attributes.push "accessibilityLabel = '#{accessibility_label}'"
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

  def self.with_attribute(attribute)
    object = new
    object.attributes.push attribute
    object
  end

  def self.all
    object = new
    object.all
    object
  end

  def with_attribute(attribute)
    attributes.push attribute
    self
  end

  def with_text(text)
    attributes.push "text = '#{text}'"
    self
  end

  def with_parent(parent)
    @parent = parent
    self
  end

  def with_accessibility_label(accessibility_label)
    attributes.push "accessibilityLabel = '#{accessibility_label}'"
    self
  end

  def with_descendants(descendants)
    @descendants = descendants
    self
  end

  # setters

  def attributes
    @attributes ||= []
  end

  def all
    @all = true
    self
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

  def descendants=(descendants)
    @descendants = descendants
    self
  end

  # subscript

  def [](*args)
    query_properties(*args)
  end

  # abstract

  def type
    fail NotImplementedError, "This method should be implemented in a subclass of #{self.class}"
  end

  # diggers

  def scroll_view
    ScrollView.with_parent self
  end

  def label
    Label.with_parent self
  end

  def segment
    Segment.with_parent self
  end

  def button
    Button.with_parent self
  end

  def switch
    Switch.with_parent self
  end

  def tab_bar_button
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

  def css_element
    WebViewCssElement.with_parent self
  end

  def xpath_element
    WebViewXpathElement.with_parent self
  end

  # properties

  def frame
    self[:frame]
  end

  def height
    frame['Height']
  end

  def width
    frame['Width']
  end

  # computed properties

  def query_string
    string = "#{type}"

    @attributes ||= []
    @attributes.each do |attribute|
      string += " {#{attribute}}"
    end

    current_query_string = string

    @descendants ||= []
    @descendants.each do |descendant|
      string += ' descendant ' + descendant.query_string + ' parent ' + current_query_string
    end

    string = parent.query_string + " descendant #{string}" unless parent.nil?

    string
  end

  # query

  def query
    safe_query query_string
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
    spices.element_exists query_string
  end

  def not_visible?
    spices.element_does_not_exist query_string
  end

  private

  def spices
    Spices.world
  end

  def query_properties(*args)
    properties = spices.map(query_string, *args)
    properties = properties.first unless @all
    properties
  end

  def safe_query(query, *args)
    Logger.debug "QUERY: #{query}"
    
    wait_for_visible

    query_map = spices.query(query, *args)
    query_map = query_map.first unless @all

    query_map
  end

  def safe_touch(touch_query)
    wait_for_visible

    spices.touch touch_query
    Wait.for_ui_animation_to_end
  end
end
