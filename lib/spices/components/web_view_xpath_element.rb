# TODO: Add xpath tood
class WebViewXpathElement < BaseComponent
  attr_accessor :xpath

  def query_string
    string = parent.query_string + " xpath:'#{xpath}'"
    string
  end

  private

  def type
    :xpath
  end
end
