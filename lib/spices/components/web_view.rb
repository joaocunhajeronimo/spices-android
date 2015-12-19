require './spices/mixins/scrollable'

class WebView < BaseComponent
  include Scrollable

  def element_with_css(css)
    element = WebViewCssElement.with_parent(self)
    element.css = css
    element
  end

  def element_with_xpath(xpath)
    element = WebViewXpathElement.with_parent(self)
    element.xpath = xpath
    element
  end

  def evaluate_javascript(javascript)
    self['query', { calabashStringByEvaluatingJavaScript: javascript }]
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
