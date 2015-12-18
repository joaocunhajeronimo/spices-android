require './spices/mixins/scrollable'

class WebView < BaseComponent
  include Scrollable

  def element_with_css(css)
    element = WebViewElement.with_parent(self)
    element.css = css
    element
  end

  private

  def type
    :webView
  end
end
