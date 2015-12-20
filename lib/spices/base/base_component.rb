class BaseComponent
  attr_reader :parent
  attr_reader :descendants
  attr_reader :attributes

  def self.attributes(*args)
    args.each do |arg|
      with_method_symb = :"with_#{arg}"
      setter_symb = :"#{arg}="
      attribute_key = arg.to_s.split('_').inject([]) { |a, e| a.push(a.empty? ? e : e.capitalize) }.join

      create_singleton_with_methods(with_method_symb, attribute_key)
      create_instance_with_methods(with_method_symb, attribute_key)
      create_setter_methods(setter_symb, attribute_key)
    end
  end

  def self.create_singleton_with_methods(name, attribute_key)
    define_singleton_method name do |attribute_value|
      object = new
      object.add_attribute object.build_equal_attribute(attribute_key, attribute_value)
      object
    end
  end

  def self.create_instance_with_methods(name, attribute_key)
    define_method name do |attribute_value|
      add_attribute build_equal_attribute(attribute_key, attribute_value)
      self
    end
  end

  def self.create_setter_methods(name, attribute_key)
    define_method name do |attribute_value|
      add_attribute build_equal_attribute(attribute_key, attribute_value)
      self
    end
  end

  attributes(:text, :accessibility_label, :id)

  # initializers

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

  # instance

  def with_parent(parent)
    @parent = parent
    self
  end

  def with_descendants(descendants)
    @descendants = descendants
    self
  end

  def with_attribute(attribute)
    attributes.push attribute
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

  def wait_for_visible(timeout)
    Wait.for(timeout) { visible? }
  end

  def wait_for_not_visible(timeout)
    Wait.for(timeout) { not_visible? }
  end

  def visible?
    spices.element_exists query_string
  end

  def not_visible?
    spices.element_does_not_exist query_string
  end

  # attribute related

  def add_attribute(attribute)
    # TODO: check if attribute is already there before pushing it, replace otherwise
    attributes.push attribute
  end

  def build_equal_attribute(name, value)
    "#{name} = '#{value}'"
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

    wait_for_visible 15

    query_map = spices.query(query, *args)
    query_map = query_map.first unless @all

    query_map
  end

  def safe_touch(touch_query)
    wait_for_visible 15

    spices.touch touch_query
    Wait.for_ui_animation_to_end
  end
end
