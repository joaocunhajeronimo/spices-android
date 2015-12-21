require 'spices/mixins/editable'

class Textfield < BaseComponent
  include Editable

  private

  def type
    :edittext
  end
end
