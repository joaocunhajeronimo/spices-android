require './spices/mixins/scrollable'

class WebView < BaseComponent
  include Scrollable

  def element_with_css(css)
    element = WebViewElement.with_parent(self)
    element.css = css
    element
  end

  def url
    self['query', 'request', 'URL']
  end

  def reload
    self['reload']
  end

  def go_back
    self['goBack']
  end

  def go_forward
    self['goForward']
  end

  private

  def type
    :webView
  end
end
