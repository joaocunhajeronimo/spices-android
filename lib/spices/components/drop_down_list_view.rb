require 'spices/mixins/scrollable'

class DropDownListView < BaseComponent
  include Scrollable

  private

  def type
    :DropDownListView
  end
end
