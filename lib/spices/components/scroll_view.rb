require 'spices/mixins/scrollable'

class ScrollView < BaseComponent
  include Scrollable

  private

  def type
    :scrollView
  end
end
