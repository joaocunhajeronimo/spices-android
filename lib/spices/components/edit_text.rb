require 'spices/mixins/editable'

class EditText < BaseComponent
  include Editable

  private

  def type
    :edittext
  end
end
