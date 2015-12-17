require './zucchini/mixins/scrollable'

class TableView < BaseComponent
  include Scrollable

  private

  def type
    :tableView
  end
end
