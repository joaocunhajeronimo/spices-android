class TableViewCell < BaseComponent
  def selected?
    query_properties :isSelected
  end

  private

  def type
    :tableViewCell
  end
end
