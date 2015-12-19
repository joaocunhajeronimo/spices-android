# TODO: Add xpath tood
class WebViewCssElement < BaseComponent
  attr_accessor :css

  def query_string
    string = parent.query_string + " css:'#{css}'"
    string
  end

  private

  def type
    :css
  end
end
