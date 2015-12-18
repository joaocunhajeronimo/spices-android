require './spices/mixins/selectable'

class TableViewCell < BaseComponent
  include Selectable

  private

  def type
    :tableViewCell
  end
end
