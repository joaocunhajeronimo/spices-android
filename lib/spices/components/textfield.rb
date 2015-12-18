require './spices/mixins/editable'

class Textfield < BaseComponent
  include Editable

  private

  def type
    :textField
  end
end
