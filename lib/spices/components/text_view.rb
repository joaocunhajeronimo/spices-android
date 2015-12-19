require 'spices/mixins/editable'

class TextView < BaseComponent
  include Editable

  private

  def type
    :textView
  end
end
