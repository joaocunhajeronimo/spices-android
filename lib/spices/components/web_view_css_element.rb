class WebViewCssElement < BaseComponent
  attr_accessor :css

  def child(child_css)
    element = self
    element.css = css.insert( -1, (' ' + child_css))
    element
  end

  def query_string
    string = parent.query_string + " css:'#{css}'"
    string
  end

  private

  def type
    :css
  end
end
