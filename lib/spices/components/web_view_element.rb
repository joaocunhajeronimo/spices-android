class WebViewElement < BaseComponent
  attr_accessor :css

  def query_string
    string = super
    string += ":'#{css}'" unless css.nil?
    string
  end

  private

  def type
    :css
  end
end
